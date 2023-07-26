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
    
    var invokedFetchDataCount = 0
    var invokedFetchData = false
   
    func fetchData() {
        invokedFetchData = true
        invokedFetchDataCount += 1
        presenter?.hideActivityIndicator()
    }
    
    
}
