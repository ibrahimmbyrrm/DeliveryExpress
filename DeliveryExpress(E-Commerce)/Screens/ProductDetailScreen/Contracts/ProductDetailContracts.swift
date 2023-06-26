//
//  ProductDetailContracts.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 26.06.2023.
//

import Foundation
import UIKit

protocol ProductDetailViewInterface {
    var presenter : ProductDetailPresenterInterface? {get set}
}

protocol ProductDetailPresenterInterface {
    
}

protocol ProductDetailInteractorInterface {
    var presenter : ProductDetailPresenterInterface? {get set}
}

protocol ProductDetailRouterInterface {
    var presenter : ProductDetailPresenterInterface? {get set}
}

protocol ProductDetailBuilderInterface {
    static func buildProductScreen(product : Product) -> UIViewController
}
