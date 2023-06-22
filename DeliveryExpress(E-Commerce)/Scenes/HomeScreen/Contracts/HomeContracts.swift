//
//  HomeContracts.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation
import UIKit

protocol HomeRouterInterface {
    var presenter : HomePresenterInterface? {get set}
}

protocol HomePresenterInterface {
    var interactor : HomeInteractorInterface {get set}
    var view : HomeViewInterface {get set}
    var router : HomeRouterInterface {get set}
    
    func handleInteractorOutput(with output : HomeInteractorOutput)
    func load()
    func hideActivityIndicator()
}

protocol HomeInteractorInterface {
    var presenter : HomePresenterInterface? {get set}
    func fetchData()
}

protocol HomeViewInterface {
    var presenter : HomePresenterInterface? {get set}
    
    func saveCategories(with output : HomePresenterOutput)
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

typealias EntryPoint = HomeViewInterface & UIViewController


