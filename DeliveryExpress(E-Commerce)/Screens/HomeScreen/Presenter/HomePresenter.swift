//
//  HomePresenter.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation


final class HomePresenter : HomePresenterInterface{
    private let interactor: HomeInteractorInterface
    private weak var view: HomeViewInterface?
    private let router: HomeRouterInterface
    
    init(interactor: HomeInteractorInterface, view: HomeViewInterface, router: HomeRouterInterface) {
        self.interactor = interactor
        self.view = view
        self.router = router
    }
    
    func handleViewOutput(with output : HomeViewOutput) {
        switch output {
        case .categoryClicked(let selectedCategory):
            print(selectedCategory)
        case.productClicked(let selectedProduct):
            router.navigateTo(to: .toProductDetail(selectedProduct))
        case .loadData:
            print("fetch data called")
            interactor.fetchData()
        }
    }
    
    func handleInteractorOutput(with output : HomeInteractorOutput) {
        switch output {
        case .categoriesLoaded(let categories):
            view?.saveData(with: .saveCategories(categories))
        case .productsLoaded(let products):
            view?.saveData(with: .saveProducts(products))
        case .loadFailed:
            print("error")
        }
    }
    
    func hideActivityIndicator() {
        view?.stopActivityIndicator()
    }
        
}
