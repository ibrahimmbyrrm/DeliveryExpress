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
        let decodableData = UserDefaults.standard.data(forKey: "savedData")
        var fetchedCart =  try? JSONDecoder().decode([Product].self, from: decodableData!)
        fetchedCart?.append(product)
        guard let encoded = try? JSONEncoder().encode(fetchedCart) else {return}
        UserDefaults.standard.set(encoded, forKey: "savedData")
        presenter?.handleInteractorOutput()
    }
    
}
