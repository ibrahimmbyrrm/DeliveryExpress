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
    
    
    init(service : NetworkService) {
        self.service = service
    }
    
    var invokedFetchDataCount = 0
    var invokedFetchDataMethod = false
    var invokedFetchDataCalledService = false
    var exceptedSuccessArray = [Product]()
    
    func fetchData() {
        service.fetchData(type: EndPointItems<[Product]>.products) { result in
            self.invokedFetchDataCalledService = true
            switch result {
            case .success(let mockProducts):
                self.exceptedSuccessArray = mockProducts
            case .failure(let erorr):
                print(erorr)
            }
            
        }
        invokedFetchDataMethod = true
        invokedFetchDataCount += 1
        presenter?.hideActivityIndicator()
    }
    
    
}
