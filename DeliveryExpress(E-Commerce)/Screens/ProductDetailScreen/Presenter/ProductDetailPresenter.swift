//
//  ProductDetailPresenter.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 26.06.2023.
//

import Foundation
import UIKit


class ProductDetailPresenter : ProductDetailPresenterInterface {
    private let interactor : ProductDetailInteractorInterface
    private let view : ProductDetailViewInterface
    private let router : ProductDetailRouterInterface
    
    init(interactor : ProductDetailInteractorInterface,view : ProductDetailViewInterface,router : ProductDetailRouterInterface) {
        self.interactor = interactor
        self.view = view
        self.router = router
    }
    
    
}
