//
//  DiscoverInteractor.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 27.06.2023.
//

import Foundation

class DiscoverInteractor : DiscoverInteractorInterface {
    var presenter: DiscoverPresenterInterface?
    private let service : NetworkService
    init(service : NetworkService) {
        self.service = service
    }
    func fetchData<T>(endPoint : EndPointItems<T>) {
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        service.fetchData(type: endPoint) { [weak self] result in
            guard let self else {return}
            defer {dispatchGroup.leave()}
            switch result {
            case .success(let decoded):
                self.presenter?.handleInteractorOutout(with: .productsLoaded(decoded as! ProductResponse))
            case .failure(let error):
                print(error)
            }
        }
        dispatchGroup.enter()
        service.fetchData(type: EndPointItems<[String]>.categories) { [weak self] result in
            guard let self else {return}
            defer {dispatchGroup.leave()}
            switch result {
            case .success(let categories):
                self.presenter?.handleInteractorOutout(with: .categoriesLoaded(categories))
            case .failure(let error):
                print(error)
            }
        }
        dispatchGroup.notify(queue: .main) {
            print("interactor işlemi tamamladı")
        }
    }
}
