//
//  UITabBarController+Extension.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 28.06.2023.
//

import Foundation
import UIKit

extension UITabBarController {
    
    convenience init(screens : [UIViewController]) {
        self.init(nibName: nil, bundle: nil)
        self.viewControllers = screens
    }
}
