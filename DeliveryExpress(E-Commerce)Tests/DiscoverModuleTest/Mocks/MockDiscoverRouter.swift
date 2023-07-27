//
//  MockDiscoverRouter.swift
//  DeliveryExpress(E-Commerce)Tests
//
//  Created by İbrahim Bayram on 26.07.2023.
//

import Foundation
import UIKit
@testable import DeliveryExpress_E_Commerce_

final class MockDiscoverRouter : DiscoverRouterInterface {
    var view: UIViewController?
    
    var invokedNavigatetoProductDetail = false
    var productToShownDetailsOf : Product?
    
    
    func navigateTo(to output: DeliveryExpress_E_Commerce_.DiscoverRouterRotations) {
        switch output {
        case .toProductDetail(let product):
            invokedNavigatetoProductDetail = true
            productToShownDetailsOf = product
        }
    }
    
    
}
