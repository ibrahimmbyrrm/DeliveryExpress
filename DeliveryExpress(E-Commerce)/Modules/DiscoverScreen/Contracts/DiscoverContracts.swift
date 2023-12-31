//
//  DiscoverContracts.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 27.06.2023.
//

import Foundation
import UIKit
//MARK: - Interfaces
protocol DiscoverViewInterface {
    var productList : [Product] {get set}
    var categoryList : [String] {get set}
    var pageTitle : String? {get set}
    var presenter : DiscoverPresenterInterface? {get set}
    func handlePresenterOutput(with output : DiscoverPresenterOutput)
    func setDelegates()
    func setupNavigationBar()
    func setupChangeCategoryButton()
    func searchByQueryText(with queryText : String)
}

protocol DiscoverInteractorInterface {
    var productResponse : ProductResponse! {get set}
    var categories : [String] {get set}
    var presenter : DiscoverPresenterInterface? {get set}
    func fetchData<T>(endPoint : EndPointItems<T>)
    func fetchCategories()
}

protocol DiscoverPresenterInterface : AnyObject {
    func handleInteractorOutput(with output : DiscoverInteractorOutput)
    func handleViewOutput(with output : DiscoverViewOutput)
    func viewDidLoad()
}

protocol DiscoverRouterInterface {
    var view : UIViewController? {get set}
    func navigateTo(to output: DiscoverRouterRotations)
}
//MARK: - Enums
enum DiscoverInteractorOutput {
    case categoriesLoaded([String])
    case productsLoaded(ProductResponse)
}
enum DiscoverViewOutput {
    case fetchQueryResults(String)
    case productClicked(Product)
    case categoryChanged(String)
    case all
}
enum DiscoverRouterRotations {
    case toProductDetail(Product)
}
enum DiscoverPresenterOutput {
    case categoriesLoaded([String])
    case productsLoaded([Product])
}
enum DiscoverBuildTypes {
    case withCategory(String)
    case allProducts
}
