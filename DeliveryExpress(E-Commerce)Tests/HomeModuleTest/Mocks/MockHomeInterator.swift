//
//  MockHomeInterator.swift
//  DeliveryExpress(E-Commerce)Tests
//
//  Created by İbrahim Bayram on 26.07.2023.
//

import Foundation
@testable import DeliveryExpress_E_Commerce_

class MockHomeInteractor : HomeInteractorInterface {
    
    var presenter: DeliveryExpress_E_Commerce_.HomePresenterInterface?
    var service: NetworkService
    
    lazy var productList: [DeliveryExpress_E_Commerce_.Product] = []
    lazy var categoryList: [String] = []
    
    init(service : NetworkService) {
        self.service = service
    }
    
    var invokedFetchDataCount = 0
    var invokedFetchDataMethod = false
    var invokedServiceFromInteractor = false
    
    func fetchData() {
        service.fetchData(type: EndPointItems<[Product]>.products) { result in
            self.invokedServiceFromInteractor = true
            self.invokedFetchDataCount += 1
            switch result {
            case .success(let mockProducts):
                self.productList = mockProducts
            case .failure(let erorr):
                print(erorr)
            }
        }
        service.fetchData(type: EndPointItems<[String]>.categories) { result in
            self.invokedFetchDataCount += 1
            switch result {
            case .success(let categories):
                self.categoryList = categories
            case .failure(let error):
                print(error)
            }
        }
        invokedFetchDataMethod = true
        presenter?.hideActivityIndicator()
    }
    
    
}
