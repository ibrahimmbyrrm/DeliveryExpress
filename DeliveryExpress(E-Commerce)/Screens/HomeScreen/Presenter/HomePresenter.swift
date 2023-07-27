//
//  HomePresenter.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation
import UIKit

final class HomePresenter : HomePresenterInterface{
    
    private let interactor: HomeInteractorInterface
    private weak var view: HomeViewInterface?
    private let router: HomeRouterInterface
    
    init(interactor: HomeInteractorInterface, view: HomeViewInterface, router: HomeRouterInterface) {
        self.interactor = interactor
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
        view?.setDelegates()
        view?.setupNavigationBar()
    }
    
    func handleViewOutput(with output : HomeViewOutput) {
        switch output {
        case .categoryClicked(let selectedCategory):
            router.navigateToDiscover(to: .toCategory(selectedCategory))
        case.productClicked(let selectedProduct):
            router.navigateToDetail(to: selectedProduct)
        case .loadData:
            interactor.fetchData()
        case .seeAllClicked:
            router.navigateToDiscover(to: .toAllProducts)
        }
    }
    
    func handleInteractorOutput(with output : HomeInteractorOutput) {
        switch output {
        case .categoriesLoaded(let categories):
            view?.handleViewOutput(with: .saveCategories(categories))
        case .productsLoaded(let products):
            view?.handleViewOutput(with: .saveProducts(products))
        case .loadFailed:
            print("error")
        }
    }

    func hideActivityIndicator() {
        view?.stopActivityIndicator()
    }
        
}
