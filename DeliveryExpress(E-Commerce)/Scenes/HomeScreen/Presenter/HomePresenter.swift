//
//  HomePresenter.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation

protocol HomePresenterInterface {
    var interactor : HomeInteractorInterface {get set}
    var view : HomeViewInterface {get set}
    var router : HomeRouterInterface {get set}
    func categoriesFethced(_ categories : [String])
}

class HomePresenter : HomePresenterInterface{
    var interactor: HomeInteractorInterface
    var view: HomeViewInterface
    var router: HomeRouterInterface
    
    init(interactor: HomeInteractorInterface, view: HomeViewInterface, router: HomeRouterInterface) {
        self.interactor = interactor
        self.view = view
        self.router = router
    }
    
    func categoriesFethced(_ categories : [String]) {
        view.saveCategories(categories)
    }
}
