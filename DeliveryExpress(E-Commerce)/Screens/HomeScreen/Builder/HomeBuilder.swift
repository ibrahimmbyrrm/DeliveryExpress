//
//  HomeBuilder.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation
import UIKit

typealias EntryPoint = HomeViewInterface & UIViewController

final class HomeBuilder {
    
    static func buildModule() -> EntryPoint {
        let interactor : HomeInteractorInterface = HomeInteractor(service: NetworkManager.shared)
        var router : HomeRouterInterface = HomeRouter()
        let view : HomeViewInterface = HomeVC()
        let presenter : HomePresenterInterface = HomePresenter(interactor: interactor, view: view, router: router)
        interactor.presenter = presenter
        view.presenter = presenter
        router.view = view as! EntryPoint
        return view as! EntryPoint
    }
}
