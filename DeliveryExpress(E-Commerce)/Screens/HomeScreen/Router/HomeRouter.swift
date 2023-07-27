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

enum DiscoverType {
    case toCategory(String)
    case toAllProducts
}

final class HomeRouter : HomeRouterInterface {
    
    weak var view: UIViewController?
    var presenteR : HomePresenterInterface?
    
    func navigateToDetail(to product: Product) {
        let detailVC = ProductDetailBuilder.buildProductScreen(product: product)
        detailVC.modalPresentationStyle = .fullScreen
        view?.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func navigateToDiscover(to discoverType : DiscoverType) {
        switch discoverType {
        case .toCategory(let category):
            view?.navigationController?.pushViewController(DiscoverBuilder.build(with: .withCategory(category)), animated: true)
        case .toAllProducts:
            view?.navigationController?.pushViewController(DiscoverBuilder.build(with: .allProducts), animated: true)
        }
    }
}
