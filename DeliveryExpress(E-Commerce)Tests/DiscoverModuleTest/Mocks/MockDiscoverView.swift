//
//  MockDiscoverView.swift
//  DeliveryExpress(E-Commerce)Tests
//
//  Created by İbrahim Bayram on 26.07.2023.
//

import Foundation
@testable import DeliveryExpress_E_Commerce_

final class MockDiscoverView : DiscoverViewInterface {
    var productList: [DeliveryExpress_E_Commerce_.Product] = []
    var categoryList: [String] = []
    var pageTitle: String?
    var presenter: DeliveryExpress_E_Commerce_.DiscoverPresenterInterface?
    
    var invokedCategoriesLoadedOutput = false
    var invokedProductsLoadedOutput = false
    var invokedSetDelegates = false
    var invokedSetupChangeCategoryButton = false
    var invokedSetupNavigationBar = false
    func handlePresenterOutput(with output: DeliveryExpress_E_Commerce_.DiscoverPresenterOutput) {
        switch output {
        case .categoriesLoaded(let categories):
            self.categoryList = categories
            invokedCategoriesLoadedOutput = true
        case .productsLoaded(let prods):
            self.productList = prods
            invokedProductsLoadedOutput = true
        }
    }
    
    func setDelegates() {
        
    }
    
    func setupNavigationBar() {
        
    }
    
    func setupChangeCategoryButton() {
        
    }
    
    
}
