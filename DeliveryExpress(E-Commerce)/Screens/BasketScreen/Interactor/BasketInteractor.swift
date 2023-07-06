//
//  BasketInteractor.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 1.07.2023.
//

import Foundation

final class BasketInteractor : BasketInteractorInterface{
    weak var presenter: BasketPresenterInterface?
 
    func handlePresenterOutput(output: BasketPresenterToInteractorOutput) {
        guard let decodableProduct = UserDefaults.standard.data(forKey: "savedData") else {return}
        guard var decoded = try? JSONDecoder().decode([Product].self, from: decodableProduct) else {return}
        switch output {
        case .loadAllItems:
            presenter?.handleInteractorOutput(output: .cartFetched(decoded))
        case .removeAtIndex(let index):
            decoded.remove(at: index)
            let encodedData = try? JSONEncoder().encode(decoded)
            UserDefaults.standard.set(encodedData, forKey: "savedData")
            presenter?.handleInteractorOutput(output: .cartFetched(decoded))
        }
        
    }

}