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
    var invokedClearCartOutputCount = 0
    
    var invokedLoadAllItemsOutput = false
    var invokedLoadAllItemsOutputCount = 0
    
    var invokedRemoveAtIndexOutput = false
    var invokedRemoveAtIndexOutputCount = 0
    
    func handlePresenterOutput(output: DeliveryExpress_E_Commerce_.BasketPresenterToInteractorOutput) {
        switch output {
        case .clearCart:
            currentCart = []
            invokedClearCartOutput = true
            invokedClearCartOutputCount += 1
        case .loadAllItems:
            currentCart = MockProducts.mockProductList
            invokedLoadAllItemsOutput = true
            invokedLoadAllItemsOutputCount += 1
        case .removeAtIndex(let index):
            currentCart.remove(at: index)
            invokedRemoveAtIndexOutput = true
            invokedRemoveAtIndexOutputCount += 1
        }
    }
    
    
}


