//
//  MockBasketInteractor.swift
//  DeliveryExpress(E-Commerce)Tests
//
//  Created by İbrahim Bayram on 26.07.2023.
//

import Foundation
@testable import DeliveryExpress_E_Commerce_

final class MockBasketInteractor : BasketInteractorInterface{

    var presenter: DeliveryExpress_E_Commerce_.BasketPresenterInterface?
    
    var currentCart: [DeliveryExpress_E_Commerce_.Product] = []
    var numberOfItemsInCart : Int {
        return currentCart.count
    }
    var invokedClearCartOutput = false
    var invokedLoadAllItemsOutput = false
    var invokedRemoveAtIndexOutput = false
    
    func handlePresenterOutput(output: DeliveryExpress_E_Commerce_.BasketPresenterToInteractorOutput) {
        switch output {
        case .clearCart:
            currentCart = []
            invokedClearCartOutput = true
        case .loadAllItems:
            currentCart.append(MockProducts.mockProduct)
            currentCart.append(MockProducts.mockProduct2)
            invokedLoadAllItemsOutput = true
        case .removeAtIndex(let index):
            currentCart.remove(at: index)
            invokedRemoveAtIndexOutput = true
        }
    }
    
    
}


