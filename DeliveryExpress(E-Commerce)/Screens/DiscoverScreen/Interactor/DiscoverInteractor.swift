//
//  DiscoverInteractor.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 27.06.2023.
//

import Foundation

final class DiscoverInteractor : DiscoverInteractorInterface {
    
    var presenter: DiscoverPresenterInterface?
    lazy var categories = [String]()
    var productResponse : ProductResponse!
    private let service : NetworkService
    
    init(service : NetworkService) {
        self.service = service
    }
    
    func fetchData<T>(endPoint : EndPointItems<T>) {
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        
        service.fetchData(type: endPoint) { [weak self] result in
            defer {dispatchGroup.leave()}
            switch result {
            case .success(let decoded):
                self?.productResponse = decoded as? ProductResponse
            case .failure(let error):
                print(error)
            }
        }
        dispatchGroup.notify(queue: .main) {            self.presenter?.handleInteractorOutput(with: .productsLoaded(self.productResponse))
        }
    }
    func fetchCategories() {
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        service.fetchData(type: EndPointItems<[String]>.categories) { [weak self] result in
            defer {dispatchGroup.leave()}
            switch result {
            case .success(let categories):
                self?.categories = categories
            case .failure(let error):
                print(error)
            }
        }
        dispatchGroup.notify(queue: .main) {
            self.presenter?.handleInteractorOutput(with: .categoriesLoaded(self.categories))
        }
    }
}
