//
//  HomeContracts.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation
import UIKit
//MARK: - Interfaces
protocol HomeRouterInterface {
    var view : UIViewController? {get set}
    func navigateToDetail(to product: Product)
    func navigateToDiscover(to discoverType : DiscoverType)
}
protocol FooterDelegate : AnyObject {
    func seeAllClicked()
}
protocol HomePresenterInterface : AnyObject {
    func handleInteractorOutput(with output : HomeInteractorOutput)
    func handleViewOutput(with output : HomeViewOutput)
    func viewDidLoad()
    func hideActivityIndicator()
}

protocol HomeInteractorInterface : AnyObject {
    var presenter : HomePresenterInterface? {get set}
    var service : NetworkService {get set}
    func fetchData()
}

protocol HomeViewInterface : AnyObject {
    var categoryList : [String] {get set}
    var productList : [Product] {get set}
    var presenter : HomePresenterInterface? {get set}
    func setupNavigationBar()
    func setDelegates()
    func saveData(with output : HomePresenterOutput)
    func stopActivityIndicator()
}

//MARK: - Enums
enum HomePresenterOutput {
    case saveProducts([Product])
    case saveCategories([String])
}

enum HomeInteractorOutput {
    case categoriesLoaded([String])
    case productsLoaded([Product])
    case loadFailed
}
enum HomeViewOutput : Equatable {
    static func == (lhs: HomeViewOutput, rhs: HomeViewOutput) -> Bool {
        return lhs == rhs
    }
    
    case productClicked(Product)
    case categoryClicked(String)
    case loadData
    case seeAllClicked
}




