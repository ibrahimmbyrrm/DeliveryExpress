//
//  MockHomeView.swift
//  DeliveryExpress(E-Commerce)Tests
//
//  Created by İbrahim Bayram on 26.07.2023.
//

import Foundation
@testable import DeliveryExpress_E_Commerce_

class MockHomeView : HomeViewInterface {
    var categoryList: [String] = []
    var productList: [DeliveryExpress_E_Commerce_.Product] = []
    var presenter: DeliveryExpress_E_Commerce_.HomePresenterInterface?
    
    var invokedSetupNavigationBar = false
    var invokedSetDelegates = false
    var invokedStopActivityIndicator = false
    var invokedSaveCategoriesOutput = false
    var invokedSaveProductsOutput = false
    
    func setupNavigationBar() {
        invokedSetupNavigationBar = true
    }
    
    func setDelegates() {
        invokedSetDelegates = true
    }
    
    func handleViewOutput(with output: DeliveryExpress_E_Commerce_.HomePresenterOutput) {
        switch output {
        case .saveCategories(let categorieos):
            self.categoryList = categorieos
            invokedSaveCategoriesOutput = true
        case .saveProducts(let products):
            self.productList = products
            invokedSaveProductsOutput = true
        }
    }
    
    func stopActivityIndicator() {
        invokedStopActivityIndicator = true
    }
    
    
}
