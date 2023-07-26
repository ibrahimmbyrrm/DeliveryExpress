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
    
    func saveData(with output: DeliveryExpress_E_Commerce_.HomePresenterOutput) {
        switch output {
        case .saveCategories(_):
            invokedSaveCategoriesOutput = true
        case .saveProducts(_):
            invokedSaveProductsOutput = true
        }
    }
    
    func stopActivityIndicator() {
        invokedStopActivityIndicator = true
    }
    
    
}
