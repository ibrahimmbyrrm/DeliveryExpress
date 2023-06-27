//
//  UIImageView+Extension.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 27.06.2023.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlString : String) {
        guard let url = URL(string: urlString) else {return}
        let resource = KF.ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
