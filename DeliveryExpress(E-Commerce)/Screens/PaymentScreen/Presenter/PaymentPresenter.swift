//
//  PaymentPresenter.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 9.07.2023.
//

import Foundation

final class PaymentPresenter : PaymentPresenterInterface{
    
    private let view : PaymentViewInterface
    private let interactor : PaymentInteractorInterface
    private let router : PaymentRouterInterface
    
    init(view: PaymentViewInterface, interactor: PaymentInteractorInterface, router: PaymentRouterInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func handleViewOutput(with output: PaymentViewOutput) {
        
    }
    func handleInteractorOutput(with output: PaymentInteractorOutput) {
        
    }
}
