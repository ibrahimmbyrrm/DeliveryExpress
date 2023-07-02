//
//  BasketInteractor.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 1.07.2023.
//

import Foundation

class BasketInteractor : BasketInteractorInterface{
    weak var presenter: BasketPresenterInterface?
    var cartList = [Product]()
 
    func readUserDefaults() {
        guard let decodableProduct = UserDefaults.standard.data(forKey: "savedData") else {return}
        guard let decoded = try? JSONDecoder().decode([Product].self, from: decodableProduct) else {return}
        presenter?.handleInteractorOutput(output: .cartFetched(decoded))
    }

}
