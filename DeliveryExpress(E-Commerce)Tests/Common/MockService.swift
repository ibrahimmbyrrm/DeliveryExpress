//
//  MockService.swift
//  DeliveryExpress(E-Commerce)Tests
//
//  Created by İbrahim Bayram on 27.07.2023.
//

import Foundation
@testable import DeliveryExpress_E_Commerce_

final class MockService : NetworkService {
    
    var invokedFetchDataService = false
    var invokedFetchDataServiceCount = 0
    
    var response : Result<Product,NetworkError>?
    
    func fetchData<T>(type: DeliveryExpress_E_Commerce_.EndPointItems<T>, completion: @escaping (Result<T, DeliveryExpress_E_Commerce_.NetworkError>) -> Void) where T : Decodable {
        invokedFetchDataService = true
        invokedFetchDataServiceCount += 1
        switch type {
        case .categories:
            completion(.success(MockCategories.mockCategoryList as! T))
        case .products:
            completion(.success(MockProducts.mockProductList as! T))
        case .productsOfCategory(_):
            completion(.success(MockProducts.mockProductList as! T))
        case .search(_):
            completion(.success(MockProducts.mockProductList as! T))
        case .topProducts(_):
            completion(.success(MockProducts.mockProductList as! T))
        }
    }
}
