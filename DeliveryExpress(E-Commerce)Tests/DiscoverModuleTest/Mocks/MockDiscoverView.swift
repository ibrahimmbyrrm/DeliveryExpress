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
    var invokedCategoriesLoadedOutputCount = 0
    
    var invokedProductsLoadedOutput = false
    var invokedProductsLoadedOutputCount = 0
    
    var invokedSetDelegates = false
    var invokedSetDelegatesCount = 0
    
    var invokedSetupChangeCategoryButton = false
    var invokedSetupChangeCategoryButtonCount = 0
    
    var invokedSetupNavigationBar = false
    var invokedSetupNavigationBarCount = 0
    
    
    func handlePresenterOutput(with output: DeliveryExpress_E_Commerce_.DiscoverPresenterOutput) {
        switch output {
        case .categoriesLoaded(let categories):
            self.categoryList = categories
            invokedCategoriesLoadedOutput = true
            invokedCategoriesLoadedOutputCount += 1
        case .productsLoaded(let prods):
            self.productList = prods
            invokedProductsLoadedOutput = true
            invokedProductsLoadedOutputCount += 1
        }
    }
    
    func searchByQueryText(with queryText: String) {
        presenter?.handleViewOutput(with: .fetchQueryResults(queryText))
    }
    
    func setDelegates() {
        invokedSetDelegates = true
        invokedSetDelegatesCount += 1
    }
    
    func setupNavigationBar() {
        invokedSetupNavigationBar = true
        invokedSetupNavigationBarCount += 1
    }
    
    func setupChangeCategoryButton() {
        invokedSetupChangeCategoryButton = true
        invokedSetupChangeCategoryButtonCount += 1
    }
    
    
}
