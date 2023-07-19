//
//  UIColor+Ext.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 25.06.2023.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        var formattedString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if formattedString.hasPrefix("#") {
            formattedString.remove(at: formattedString.startIndex)
        }
        
        let scanner = Scanner(string: formattedString)
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
            var red, green, blue: CGFloat
            red = CGFloat((hexNumber & 0xff0000) >> 16) / 255.0
            green = CGFloat((hexNumber & 0x00ff00) >> 8) / 255.0
            blue = CGFloat(hexNumber & 0x0000ff) / 255.0
            
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        } else {
            self.init(white: 1.0, alpha: alpha)
        }
    }
}

