//
//  MockProductDetailRouter.swift
//  DeliveryExpress(E-Commerce)Tests
//
//  Created by İbrahim Bayram on 27.07.2023.
//

import Foundation
import UIKit
@testable import DeliveryExpress_E_Commerce_

final class MockProductDetailRouter : ProductDetailRouterInterface {
    var view: UIViewController?
    
    var productToBePaid : Product?
    var invokedNavigateToProductPayment = false
    
    func navigateToProductPayment(to product: DeliveryExpress_E_Commerce_.Product) {
        productToBePaid = product
        invokedNavigateToProductPayment = true
    }
    
    
}
