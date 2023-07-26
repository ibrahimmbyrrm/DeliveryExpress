//
//  MockBasketRouter.swift
//  DeliveryExpress(E-Commerce)Tests
//
//  Created by İbrahim Bayram on 26.07.2023.
//

import Foundation
import UIKit
@testable import DeliveryExpress_E_Commerce_

final class MockBasketRouter : BasketRouterInterface {
    var view: UIViewController?
    
    var invokedNavigateToPaymentScreen = false
    var invokedNavigateToDetail = false
    func navigateTo(to rotation: DeliveryExpress_E_Commerce_.BasketRotations) {
        switch rotation {
        case .toPaymentScreen(_):
            invokedNavigateToPaymentScreen = true
        case .toProductDetail(_):
            invokedNavigateToDetail = true
        }
    }
    
    
}
