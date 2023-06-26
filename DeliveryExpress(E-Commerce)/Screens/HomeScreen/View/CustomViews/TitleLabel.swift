//
//  TitleLabel.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 23.06.2023.
//

import UIKit

class TitleLabel : UILabel {
    
    init(text : String) {
        super.init(frame: .zero)
        self.text = text
        self.textAlignment = .center
        self.font = UIFont.boldSystemFont(ofSize: 28)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = 1
        self.textColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
