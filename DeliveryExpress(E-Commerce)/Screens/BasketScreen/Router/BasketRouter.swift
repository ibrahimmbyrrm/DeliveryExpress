//
//  BasketRouter.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 1.07.2023.
//

import Foundation
import UIKit

final class BasketRouter : BasketRouterInterface{
    var view: UIViewController?
    
    func navigateTo(to rotation : BasketRotations) {
        switch rotation {
        case .toProductDetail(let product):
            let detailVC = ProductDetailBuilder.buildProductScreen(product: product)
            detailVC.modalPresentationStyle = .fullScreen
            view?.navigationController?.pushViewController(detailVC, animated: true)
        case .toPaymentScreen:
            print("go to payment")
        }
    }
}
