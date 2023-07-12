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
    func navigateTo(to output : HomeRouterRotations)
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
    func fetchData()
}

protocol HomeViewInterface : AnyObject {
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
enum HomeViewOutput {
    case productClicked(Product)
    case categoryClicked(String)
    case loadData
    case seeAllClicked
}


