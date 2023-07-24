//
//  ProductDetailRouter.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 26.06.2023.
//

import Foundation
import UIKit
final class ProductDetailRouter : ProductDetailRouterInterface {
    
    weak var view: UIViewController?

    func navigateToProduct(to product : Product) {
        let paymentVC = PaymentBuilder.buildModule(with: .withProduct(product))
        view?.present(paymentVC, animated: true)
    }
}
