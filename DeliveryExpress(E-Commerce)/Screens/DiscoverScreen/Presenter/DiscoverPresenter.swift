//
//  DiscoverPresenter.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 27.06.2023.
//

import Foundation

final class DiscoverPresenter : DiscoverPresenterInterface {

    private let interactor : DiscoverInteractorInterface
    private let view : DiscoverViewInterface
    private let router : DiscoverRouterInterface
    
    init(type : DiscoverBuildTypes,interactor : DiscoverInteractorInterface,view : DiscoverViewInterface,router : DiscoverRouterInterface) {
        self.interactor = interactor
        self.view = view
        self.router = router
        switch type {
        case .withCategory(let category):
            interactor.fetchData(endPoint: EndPointItems<ProductResponse>.productsOfCategory(category))
        case .allProducts:
            interactor.fetchData(endPoint: EndPointItems<ProductResponse>.products)
        }
        
    }
    
    func viewDidLoad() {
        view.setDelegates()
        view.setupChangeCategoryButton()
        view.setupNavigationBar()
    }
    
    func handleInteractorOutout(with output: DiscoverInteractorOutput) {
        switch output {
        case .productsLoaded(let response):
            view.handlePresenterOutput(with: .productsLoaded(response.products))
        case .categoriesLoaded(let categs):
            view.handlePresenterOutput(with: .categoriesLoaded(categs))
        }
    }
    
    func handleViewOutput(with output : DiscoverViewOutput) {
        switch output {
        case .fetchQueryResults(let queryText):
            interactor.fetchData(endPoint: EndPointItems<ProductResponse>.search(queryText))
        case .productClicked(let product):
            router.navigateTo(to: .toProductDetail(product))
        case .categoryChanged(let newCategory):
            interactor.fetchData(endPoint: EndPointItems<ProductResponse>.productsOfCategory(newCategory))
        case .all:
            interactor.fetchData(endPoint: EndPointItems<ProductResponse>.products)
        }
    }


}
