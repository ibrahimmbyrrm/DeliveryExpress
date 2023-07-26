//
//  MockHomeRouter.swift
//  DeliveryExpress(E-Commerce)Tests
//
//  Created by İbrahim Bayram on 26.07.2023.
//

import Foundation
import UIKit
@testable import DeliveryExpress_E_Commerce_

class MockHomeRouter : HomeRouterInterface {
    var view: UIViewController?
    
    var invokedNavigateToDetail = false
    var invokedNavigateToCategoryOutput = false
    var invokedNavigateToAllProductsOutput = false
    
    func navigateToDetail(to product: DeliveryExpress_E_Commerce_.Product) {
        invokedNavigateToDetail = true
    }
    
    func navigateToDiscover(to discoverType: DeliveryExpress_E_Commerce_.DiscoverType) {
        switch discoverType {
        case .toAllProducts:
            invokedNavigateToAllProductsOutput = true
        case .toCategory(_):
            invokedNavigateToCategoryOutput = true
        }
    }
    
}
