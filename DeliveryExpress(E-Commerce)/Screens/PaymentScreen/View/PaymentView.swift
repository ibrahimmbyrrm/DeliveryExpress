//
//  PaymentView.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 9.07.2023.
//

import Foundation
import UIKit

class PaymentView : UIView {
    
    let cardView = CreditCartView()
    let addressStackView = AddressInputStackView()
    //MARK: - Initial Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        setupCardViewConstraints()
        setupAddressInputStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Layout Functions
    private func addSubviews() {
        [cardView,addressStackView].forEach { v in
            addSubview(v)
        }
    }
    
    private func setupAddressInputStackView() {
        addressStackView.snp.makeConstraints { make in
            make.top.equalTo(cardView.snp.bottom).offset(20)
            make.height.equalTo(300)
            make.leading.equalTo(self.snp.leading).offset(10)
            make.trailing.equalTo(self.snp.trailing).inset(10)
        }
    }
    
    private func setupCardViewConstraints() {
        cardView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(20)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(373)
            make.height.equalTo(197)
        }
    }
}
