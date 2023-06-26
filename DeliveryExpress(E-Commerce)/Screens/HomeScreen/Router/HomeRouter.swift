//
//  HomeRouter.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation
import UIKit

enum routerRotations {
    case toProductDetail(Product)
    case toCategory(String)
}

class HomeRouter : HomeRouterInterface {
    weak var view: UIViewController?
    
    func navigateTo(to output: routerRotations) {
        switch output {
        case .toProductDetail(let product):
            let detailVC = ProductDetailBuilder.buildProductScreen(product: product)
            detailVC.modalPresentationStyle = .fullScreen
            view?.navigationController?.pushViewController(detailVC, animated: true)
        case .toCategory(let category):
            print(category)
        }
    }
}
