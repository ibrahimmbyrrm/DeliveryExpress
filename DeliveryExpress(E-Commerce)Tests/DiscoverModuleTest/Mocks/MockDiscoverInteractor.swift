//
//  MockDiscoverInteractor.swift
//  DeliveryExpress(E-Commerce)Tests
//
//  Created by İbrahim Bayram on 26.07.2023.
//

import Foundation
@testable import DeliveryExpress_E_Commerce_

final class MockDiscoverInteractor : DiscoverInteractorInterface {
    var presenter: DeliveryExpress_E_Commerce_.DiscoverPresenterInterface?
    
    var invokedFetchCategories = false
    var invokedFetchProducts = false
    var invokedFetchProductsOfCategory = false
    var invokedFetchQueryResults = false
    var invokedFetchTopProducts = false
    
    var queryResult = ""
    var selectedCategoery = ""
    
    func fetchData<T>(endPoint: DeliveryExpress_E_Commerce_.EndPointItems<T>) where T : Decodable {
        switch endPoint {
        case .categories:
            invokedFetchCategories = true
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
        
        
    }
}
