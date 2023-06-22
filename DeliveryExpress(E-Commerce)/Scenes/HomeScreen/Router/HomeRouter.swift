//
//  HomeRouter.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation

protocol HomeRouterInterface {
    var presenter : HomePresenterInterface? {get set}
}

class HomeRouter : HomeRouterInterface {
    var presenter: HomePresenterInterface?
    
    func navigateTo() {
        
    }
}
