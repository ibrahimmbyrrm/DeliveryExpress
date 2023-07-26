//
//  MockBasketView.swift
//  DeliveryExpress(E-Commerce)Tests
//
//  Created by İbrahim Bayram on 26.07.2023.
//

import Foundation
@testable import DeliveryExpress_E_Commerce_

final class MockBasketView : BasketViewInterface{
    var cartList: [DeliveryExpress_E_Commerce_.Product] = []
    var presenter: DeliveryExpress_E_Commerce_.BasketPresenterInterface?
    
    var invokedSetDelegates = false
    var invokedSetupNavigationController = false
    var invokedCartFetched = false
    var invokedViewWillAppear = false
    func setDelegates() {
        invokedSetDelegates = true
    }
    
    func setupNavigationController() {
        invokedSetupNavigationController = true
    }
    
    func callCurrentCart() {
        invokedViewWillAppear = true
    }
    
    func handlePresenterOutput(output: DeliveryExpress_E_Commerce_.BasketPresenterOutput) {
        switch output {
        case .cartFetched(_):
            invokedCartFetched = true
        }
    }
    
    
}
