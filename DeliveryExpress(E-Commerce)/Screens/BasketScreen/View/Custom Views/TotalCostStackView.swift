//
//  TotalCostStackView.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 2.07.2023.
//

import Foundation
import UIKit

class TotalCostStackView : UIStackView {
    private let totalCostTitleLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Total Cost:"
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    private let costLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .blue
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
        setupStackViewProperties()
    }
    
    func configureTotalCost(cart : [Product]) {
       let result =  cart.map({ $0.price}).reduce(0, +)
        print(result)
        self.costLabel.text = "\(result)$"
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackViewProperties() {
        distribution = .equalSpacing
        axis = .horizontal
    }
    
    private func addSubviews() {
        [costLabel, totalCostTitleLabel].forEach { v in
            addArrangedSubview(v)
        }
        
    }
    
    private func setupConstraints() {
        totalCostTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(10)
            make.centerX.equalTo(self.snp.centerX)
        }
        costLabel.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).inset(10)
            make.centerX.equalTo(self.snp.centerX)
        }
    }
}
