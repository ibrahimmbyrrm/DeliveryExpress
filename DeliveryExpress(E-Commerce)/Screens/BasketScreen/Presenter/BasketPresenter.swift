//
//  BasketPresenter.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 1.07.2023.
//

import Foundation

final class BasketPresenter : BasketPresenterInterface {
    
    let router : BasketRouterInterface
    let view : BasketViewInterface
    let interactor : BasketInteractorInterface
    
    init(router: BasketRouterInterface, view: BasketViewInterface, interactor: BasketInteractorInterface) {
        self.router = router
        self.view = view
        self.interactor = interactor
    }
    
    func handleInteractorOutput(output : BasketInteractorOutput) {
        switch output {
        case .cartFetched(let productList):
            view.handlePresenterOutput(output: .cartFetched(productList))
        }
    }
    
    func handleViewOutput(output : BasketViewOutput) {
        switch output {
        case .loadCart:
            interactor.handlePresenterOutput(output: .loadAllItems)
        case .productClicked(let product):
            router.navigateTo(to: .toProductDetail(product))
        case .deleteItem(let itemIndex):
            interactor.handlePresenterOutput(output: .removeAtIndex(itemIndex))
        }
    }
}