//
//  ProductDetailContracts.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 26.06.2023.
//

import Foundation
import UIKit
//MARK: - Interfaces
protocol ProductDetailViewInterface {
    var product : Product {get set}
    var presenter : ProductDetailPresenterInterface? {get set}
    func setDelegates()
    func productAddedToCart()
}

protocol ProductDetailPresenterInterface : AnyObject {
    func handleViewOutput(with output : ProductDetailViewOutput)
    func viewDidLoad()
    func handleInteractorOutput()
}

protocol ProductDetailInteractorInterface {
    var presenter : ProductDetailPresenterInterface? {get set}
    func saveToUserDefaults(product : Product)
}

protocol ProductDetailRouterInterface {
    var view : UIViewController? {get set}
    func navigateToProduct(to product : Product)
}

protocol ProductDetailBuilderInterface {
    static func buildProductScreen(product : Product) -> UIViewController
}
protocol DetailButtonsInterface : AnyObject {
    func addToCartClicked()
    func goToPaymentClicked()
}
//MARK: - Enums
enum ProductDetailViewOutput {
    case addToCart(Product)
    case goToPayment(Product)
}
