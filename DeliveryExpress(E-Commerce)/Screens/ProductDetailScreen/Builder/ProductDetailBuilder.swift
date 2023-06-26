//
//  ProductDetailBuilder.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 26.06.2023.
//

import Foundation
import UIKit

class ProductDetailBuilder : ProductDetailBuilderInterface {
    
    static func buildProductScreen(product : Product) -> UIViewController {
        var router : ProductDetailRouterInterface = ProductDetailRouter()
        var view : ProductDetailViewInterface = ProductDetailView(product: product)
        var interactor : ProductDetailInteractorInterface = ProductDetailInteractor()
        let presenter : ProductDetailPresenterInterface = ProductDetailPresenter(interactor: interactor, view: view, router: router)
        interactor.presenter = presenter
        view.presenter = presenter
        router.presenter = presenter
        return view as! UIViewController
    }
}
