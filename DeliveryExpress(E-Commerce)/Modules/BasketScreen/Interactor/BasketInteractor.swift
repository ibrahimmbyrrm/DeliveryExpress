//
//  BasketInteractor.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 1.07.2023.
//

import Foundation

final class BasketInteractor : BasketInteractorInterface{
    weak var presenter: BasketPresenterInterface?
    lazy var currentCart : [Product] = [Product]()
    
    func handlePresenterOutput(output: BasketPresenterToInteractorOutput) {
        
        guard let decodableProduct = UserDefaults.standard.data(forKey: Constants.UserDefaultsKey) else {return}
        guard var decoded = try? JSONDecoder().decode([Product].self, from: decodableProduct) else {return}
        var currentBadge = decoded.count
        
        switch output {
            
        case .loadAllItems:
            
            self.currentCart = decoded
            
        case .removeAtIndex(let index):
            
            decoded.remove(at: index)
            let encodedData = try? JSONEncoder().encode(decoded)
            UserDefaults.standard.set(encodedData, forKey: Constants.UserDefaultsKey)
            currentBadge = decoded.count
            self.currentCart = decoded
            
        case .clearCart:
            
            let encoded = try? JSONEncoder().encode([Product]())
            UserDefaults.standard.set(encoded, forKey: Constants.UserDefaultsKey)
            currentBadge = 0
            self.currentCart = [Product]()
            
        }
        presenter?.handleInteractorOutput(output: .cartFetched(self.currentCart))
        UserDefaults.standard.synchronize()
        SceneDelegate.shared?.basketView.tabBarItem.badgeValue = "\(currentBadge)"
        
    }

}
