//
//  ProductDetailPresenter.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 26.06.2023.
//

import Foundation
import UIKit

final class ProductDetailPresenter : ProductDetailPresenterInterface {
    private let interactor : ProductDetailInteractorInterface
    private let view : ProductDetailViewInterface
    private let router : ProductDetailRouterInterface
    
    init(interactor : ProductDetailInteractorInterface,view : ProductDetailViewInterface,router : ProductDetailRouterInterface) {
        self.interactor = interactor
        self.view = view
        self.router = router
    }
    
    ///Eğer handleViewOutput fonksiyonuna başka bir output türü eklemezsek, output enumu üzerinde değişiklik yapıp product parametresini direk fonksiyonda alırız ve output girerken tekrar tekrar product vermemize gerek kalmaz.Böylelikle hafızada aynı iş için kullanılan 2 farklı product değişkeni tutulmaz.
    func handleViewOutput(with output : ProductDetailViewOutput) {
        switch output {
        case .addToCart(let product):
            interactor.saveToUserDefaults(product: product)
        case .goToPayment(let product):
            print("presenter goes to payment \(product.title)")
        }
    }
    func handleInteractorOutput() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.view.productAddedToCart()
        }
    }
    
    
}
