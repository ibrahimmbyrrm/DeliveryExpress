//
//  HomePresenter.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation


class HomePresenter : HomePresenterInterface{
    var interactor: HomeInteractorInterface
    var view: HomeViewInterface
    var router: HomeRouterInterface
    
    init(interactor: HomeInteractorInterface, view: HomeViewInterface, router: HomeRouterInterface) {
        self.interactor = interactor
        self.view = view
        self.router = router
    }
    
    func load() {
        interactor.fetchData()
    }
    
    func handleInteractorOutput(with output : HomeInteractorOutput) {
        switch output {
        case .categoriesLoaded(let categories):
            view.saveCategories(with: .saveCategories(categories))
        case .productsLoaded(let products):
            view.saveCategories(with: .saveProducts(products))
        case .loadFailed:
            print("error")
        }
    }
    
    func hideActivityIndicator() {
        view.stopActivityIndicator()
    }
    
}
