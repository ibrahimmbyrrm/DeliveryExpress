//
//  DiscoverBuilder.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 27.06.2023.
//

import Foundation
import UIKit

enum DiscoverBuildTypes {
    case withCategory(String)
    case allProducts
}

class DiscoverBuilder {
    
    static func build(with type : DiscoverBuildTypes) -> UIViewController {
        print("discover builded")
        var router : DiscoverRouterInterface = DiscoverRouter()
        var interactor : DiscoverInteractorInterface = DiscoverInteractor(service: NetworkManager.shared)
        var view : DiscoverViewInterface = DiscoverView()
        router.view = view as! UIViewController
        switch type {
        case .withCategory(let category):
            let presenter = DiscoverPresenter(type: .withCategory(category), interactor: interactor, view: view, router: router)
            interactor.presenter = presenter
            view.presenter = presenter
            view.pageTitle = category.capitalized
        case .allProducts:
            let presenter = DiscoverPresenter(type: .allProducts, interactor: interactor, view: view, router: router)
            interactor.presenter = presenter
            view.presenter = presenter
            view.pageTitle = "All Products"
        }
        
        return view as! UIViewController
        
    }
}
