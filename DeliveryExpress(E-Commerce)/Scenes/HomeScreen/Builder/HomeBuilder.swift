//
//  HomeBuilder.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation

class HomeBuilder {
    
    static func buildModule() -> EntryPoint {
        var interactor : HomeInteractorInterface = HomeInteractor()
        var router : HomeRouterInterface = HomeRouter()
        var view : HomeViewInterface = HomeView()
        var presenter : HomePresenterInterface = HomePresenter(interactor: interactor, view: view, router: router)
        interactor.presenter = presenter
        view.presenter = presenter
        router.presenter = presenter
        return view as! EntryPoint
    }
}
