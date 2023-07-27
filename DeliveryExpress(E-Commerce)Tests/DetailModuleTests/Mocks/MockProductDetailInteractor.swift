//
//  MockProductDetailInteractor.swift
//  DeliveryExpress(E-Commerce)Tests
//
//  Created by İbrahim Bayram on 27.07.2023.
//

import Foundation
@testable import DeliveryExpress_E_Commerce_

final class MockProductDetailInteractor : ProductDetailInteractorInterface {
    var presenter: DeliveryExpress_E_Commerce_.ProductDetailPresenterInterface?
    
    var invokedSaveToUserDefaults = false
    var productToBeSavedOnUserDefaults : Product?
    
    func saveToUserDefaults(product: DeliveryExpress_E_Commerce_.Product) {
        invokedSaveToUserDefaults = true
        productToBeSavedOnUserDefaults = product
    }
    
    
}
