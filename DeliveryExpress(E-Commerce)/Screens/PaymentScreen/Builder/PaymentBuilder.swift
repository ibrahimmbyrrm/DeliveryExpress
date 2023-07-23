//
//  PaymentBuilder.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 9.07.2023.
//

import Foundation

final class PaymentBuilder {
    
    static func buildModule(with type : PaymentBuildType) -> BaseViewController<PaymentView> {
        var router : PaymentRouterInterface = PaymentRouter()
        var interactor : PaymentInteractorInterface = PaymentInteractor()
        var view : PaymentViewInterface
                switch type {
                case .withCart(let cart):
                    let totalCost = cart.map {$0.price}.reduce(0, +)
                    view = PaymentVC(totalCost: totalCost)
                case .withProduct(let product):
                    view = PaymentVC(totalCost: product.price)
                }
        let presenter : PaymentPresenterInterface = PaymentPresenter(view: view, interactor: interactor, router: router)
        router.view = view as? BaseViewController<PaymentView>
        interactor.presenter = presenter
        view.presenter = presenter
        return view as! BaseViewController<PaymentView>
    }
}
