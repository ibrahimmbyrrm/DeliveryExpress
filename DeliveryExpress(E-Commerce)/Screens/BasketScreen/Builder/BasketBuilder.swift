//
//  BasketBuilder.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation
import UIKit

final class BasketBuilder {
    
    static func buildModule() -> UIViewController {
        var router : BasketRouterInterface = BasketRouter()
        var view : BasketViewInterface = BasketVC()
        var interactor : BasketInteractorInterface = BasketInteractor()
        let presenter : BasketPresenterInterface = BasketPresenter(router: router, view: view, interactor: interactor)
        router.view = view as? UIViewController
        view.presenter = presenter
        interactor.presenter = presenter
        return view as! UIViewController
    }
    
}
