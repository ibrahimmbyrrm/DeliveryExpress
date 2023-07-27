//
//  MockDiscoverInteractor.swift
//  DeliveryExpress(E-Commerce)Tests
//
//  Created by İbrahim Bayram on 26.07.2023.
//

import Foundation
@testable import DeliveryExpress_E_Commerce_

final class MockDiscoverInteractor : DiscoverInteractorInterface {
    var productResponse: DeliveryExpress_E_Commerce_.ProductResponse!
    var categories: [String] = []
    var presenter: DeliveryExpress_E_Commerce_.DiscoverPresenterInterface?
    
    var invokedFetchCategories = false
    var invokedFetchProducts = false
    var invokedFetchProductsOfCategory = false
    var invokedFetchQueryResults = false
    
    var queryResult = ""
    var selectedCategoery = ""
    
    func fetchData<T>(endPoint: DeliveryExpress_E_Commerce_.EndPointItems<T>) where T : Decodable {
        switch endPoint {
        case .categories:
            break
        case .products:
            invokedFetchProducts = true
        case .productsOfCategory(let category):
            selectedCategoery = category
            invokedFetchProductsOfCategory = true
        case .search(let queryString):
            queryResult = queryString
            invokedFetchQueryResults = true
        case .topProducts(_):
            break
        }
        self.productResponse = ProductResponse(products: MockProducts.mockProductList, total: 0, skip: 0, limit: 0)
    }
    func fetchCategories() {
        self.invokedFetchCategories = true
        self.categories = MockCategories.mockCategoryList
    }
}
