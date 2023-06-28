//
//  HomeRouter.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation
import UIKit

enum HomeRouterRotations {
    case toProductDetail(Product)
    case toCategory(String)
    case toAllProducts
}

class HomeRouter : HomeRouterInterface {
    weak var view: UIViewController?
    
    func navigateTo(to output: HomeRouterRotations) {
        switch output {
        case .toProductDetail(let product):
            let detailVC = ProductDetailBuilder.buildProductScreen(product: product)
            detailVC.modalPresentationStyle = .fullScreen
            view?.navigationController?.pushViewController(detailVC, animated: true)
        case .toCategory(let category):
            view?.navigationController?.pushViewController(DiscoverBuilder.build(with: .withCategory(category)), animated: true)
        case .toAllProducts:
            view?.navigationController?.pushViewController(DiscoverBuilder.build(with: .allProducts), animated: true)
        }
    }
}
