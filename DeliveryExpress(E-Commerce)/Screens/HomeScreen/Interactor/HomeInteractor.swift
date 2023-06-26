//
//  HomeInteractor.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation

final class HomeInteractor : HomeInteractorInterface {
    weak var presenter: HomePresenterInterface?
    private let service : NetworkService

    init(service : NetworkService) {
        self.service = service
    }
    
    func fetchData() {
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        service.fetchData(type: EndPointItems<[String]>.categories) { [weak self] result in
            guard let self else {return}
            defer {dispatchGroup.leave()}
            switch result {
            case .success(let categories):
                self.presenter?.handleInteractorOutput(with: .categoriesLoaded(categories))
            case.failure(let erorr):
                print(erorr)
            }
        }
        dispatchGroup.enter()
        service.fetchData(type: EndPointItems<ProductResponse>.products) { [weak self] response in
            guard let self else {return}
            defer {dispatchGroup.leave()}
            switch response {
            case .success(let productResponse):
                self.presenter?.handleInteractorOutput(with: .productsLoaded(productResponse.products))
            case .failure(let error):
                print(error)
            }
        }
        /// -When all api calls done and all data transfered to presenter, interactor called presenter again for stoping activity indicator on view.
        dispatchGroup.notify(queue: .main) {
            self.presenter?.hideActivityIndicator()
        }
    }
}
