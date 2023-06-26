//
//  UIImage+AFImage.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 25.06.2023.
//

import Foundation
import Alamofire
import UIKit

extension UIImageView {
    func setWithUrl(url : String) {
        AF.request(url).response { result in
            switch result.result {
            case .success(let data):
                guard let data else {return}
                self.image = UIImage(data: data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
