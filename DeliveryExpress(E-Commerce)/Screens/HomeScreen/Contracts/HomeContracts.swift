//
//  HomeContracts.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation
import UIKit

protocol HomeRouterInterface {
    var view : UIViewController? {get set}
    func navigateTo(to output : HomeRouterRotations)
}

protocol HomePresenterInterface : AnyObject {
    func handleInteractorOutput(with output : HomeInteractorOutput)
    func handleViewOutput(with output : HomeViewOutput)
    func hideActivityIndicator()
}

protocol HomeInteractorInterface : AnyObject {
    var presenter : HomePresenterInterface? {get set}
    func fetchData()
}

protocol HomeViewInterface : AnyObject {
    var presenter : HomePresenterInterface? {get set}
    func saveData(with output : HomePresenterOutput)
    func stopActivityIndicator()
}

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


typealias EntryPoint = HomeViewInterface & UIViewController


