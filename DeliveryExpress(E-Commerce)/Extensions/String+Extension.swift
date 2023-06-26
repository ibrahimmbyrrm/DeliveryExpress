//
//  String+Extension.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 26.06.2023.
//

import Foundation

extension String {
    func asUrl() -> URL? {
        guard let url = URL(string: self) else {return nil}
        return url
    }
}
