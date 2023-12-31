//
//  ProductDetailBuilder.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 26.06.2023.
//

import Foundation
import UIKit

final class ProductDetailBuilder : ProductDetailBuilderInterface {
    
    static func buildProductScreen(product : Product) -> UIViewController {
        var router : ProductDetailRouterInterface = ProductDetailRouter()
        var view : ProductDetailViewInterface = ProductDetailVC(product: product)
        var interactor : ProductDetailInteractorInterface = ProductDetailInteractor()
        let presenter : ProductDetailPresenterInterface = ProductDetailPresenter(interactor: interactor, view: view, router: router)
        interactor.presenter = presenter
        view.presenter = presenter
        router.view = view as? UIViewController
        return view as! UIViewController
    }
}
