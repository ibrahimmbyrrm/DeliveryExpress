//
//  BaseViewController.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 6.07.2023.
//

import Foundation
import UIKit

///Generic View Controller
class BaseViewController<V : UIView> : UIViewController {
    var rootView : V {
        view as! V
    }
    override func loadView() {
        view = V()
    }
    
}

