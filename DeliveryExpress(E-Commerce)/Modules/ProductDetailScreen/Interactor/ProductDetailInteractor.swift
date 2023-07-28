//
//  ProductDetailInteractor.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 26.06.2023.
//

import Foundation
import UIKit

final class ProductDetailInteractor : ProductDetailInteractorInterface {
    
    weak var presenter: ProductDetailPresenterInterface?
    
    func saveToUserDefaults(product : Product) {
        if let decodableData = UserDefaults.standard.data(forKey: Constants.UserDefaultsKey) {
            var fetchedCart =  try? JSONDecoder().decode([Product].self, from: decodableData)
            fetchedCart?.append(product)
            guard let encoded = try? JSONEncoder().encode(fetchedCart) else {return}
            UserDefaults.standard.set(encoded, forKey: Constants.UserDefaultsKey)
        }else {
            let newCart : [Product] = [product]
            guard let encoded = try? JSONEncoder().encode(newCart) else {return}
            UserDefaults.standard.set(encoded, forKey: Constants.UserDefaultsKey)
        }
        guard var badgeValue = Int(SceneDelegate.shared?.basketView.tabBarItem.badgeValue ?? "0") else {return}
        badgeValue += 1
        SceneDelegate.shared?.basketView.tabBarItem.badgeValue = "\(badgeValue)"
        presenter?.handleInteractorOutput()
        
        
    }
    
}
