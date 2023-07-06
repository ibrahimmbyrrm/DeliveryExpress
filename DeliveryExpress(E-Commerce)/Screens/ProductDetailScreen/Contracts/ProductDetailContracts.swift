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

protocol ProductDetailPresenterInterface : AnyObject {
    func handleViewOutput(with output : ProductDetailViewOutput)
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
protocol DetailButtonsInterface : AnyObject {
    func addToCartClicked()
    func goToPaymentClicked()
}

//May be changed
enum ProductDetailViewOutput {
    case addToCart(Product)
    case goToPayment(Product)
}