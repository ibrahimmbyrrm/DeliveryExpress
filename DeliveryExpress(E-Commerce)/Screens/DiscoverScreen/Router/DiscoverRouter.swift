//
//  DiscoverRouter.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 27.06.2023.
//

import Foundation
import UIKit
class DiscoverRouter : DiscoverRouterInterface {
    weak var view: UIViewController?
    
    func navigateTo(to output: DiscoverRouterRotations) {
        switch output {
        case .toProductDetail(let product):
            let detailVC = ProductDetailBuilder.buildProductScreen(product: product)
            detailVC.modalPresentationStyle = .fullScreen
            view?.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
