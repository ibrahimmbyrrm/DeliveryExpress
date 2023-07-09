//
//  TotalCostStackView.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 2.07.2023.
//

import Foundation
import UIKit

protocol PaymentButtonDelegate : AnyObject {
    func goToPaymentClicked()
}

class TotalCostStackView : UIStackView {
    
    weak var delegate : PaymentButtonDelegate?
    //MARK: - UI Objects
    private let totalCostTitleLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = Constants.BasketConstants.totalCostTitle
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        label.backgroundColor = .gray
        return label
    }()
    
    private let goToPaymentButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.tintColor = .orange
        button.layer.cornerRadius = 10
        button.setTitle("Go to Payment", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.addTarget(nil, action: #selector(goToPaymentTapped), for: .touchUpInside)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        addSubviews()
        setutGoToPaymentButtonConstraints()
        setupTotalCostTitleLabelConstraints()
        setupStackViewProperties()
    }
    
    func configureTotalCost(cart : [Product]) {
        let result =  cart.map({ $0.price}).reduce(0, +)
        goToPaymentButton.isHidden = result == 0 ? true : false
        self.totalCostTitleLabel.text = "Total Cost : \(result)$"
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Selector Methods
    @objc func goToPaymentTapped() {
        delegate?.goToPaymentClicked()
    }
    //MARK: - Layout Functions
    private func setupStackViewProperties() {
        distribution = .fillEqually
        axis = .horizontal
    }
    
    private func addSubviews() {
        [totalCostTitleLabel,goToPaymentButton].forEach { v in
            addArrangedSubview(v)
        }
    }
    
    private func setupTotalCostTitleLabelConstraints() {
        totalCostTitleLabel.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
    }
    
    private func setutGoToPaymentButtonConstraints() {
        goToPaymentButton.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
    }
    
}
