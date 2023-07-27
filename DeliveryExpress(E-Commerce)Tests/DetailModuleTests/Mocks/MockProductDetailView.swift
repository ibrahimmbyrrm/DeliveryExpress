//
//  MockProductDetailView.swift
//  DeliveryExpress(E-Commerce)Tests
//
//  Created by İbrahim Bayram on 27.07.2023.
//

import Foundation
@testable import DeliveryExpress_E_Commerce_

final class MockProductDetailView : ProductDetailViewInterface {
    
    var presenter: DeliveryExpress_E_Commerce_.ProductDetailPresenterInterface?
    var product: DeliveryExpress_E_Commerce_.Product
    
    init(product : Product) {
        self.product = product
    }
    
    var invokedSetupView = false
    var rootViewConfigureationWith : Product?
    
    var invokedSetDelegates = false
    
    var invokedProductAddedToCart = false
    var producdDidAddedToCart : Product?
    
    func setDelegates() {
        invokedSetDelegates = true
    }
    
    func setupView(with product: Product) {
        invokedSetupView = true
        rootViewConfigureationWith = product
    }
    
    func productAddedToCart() {
        invokedProductAddedToCart = true
    }
    
    
}
