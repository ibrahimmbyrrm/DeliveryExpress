//
//  AddressTextField.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 9.07.2023.
//

import Foundation
import UIKit

class AddressTextField : UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    convenience init(placeholder : String) {
        self.init()
        self.placeholder = placeholder
        self.borderStyle = .line
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
