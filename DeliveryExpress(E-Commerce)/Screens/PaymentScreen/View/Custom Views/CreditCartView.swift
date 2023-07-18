//
//  CreditCartView.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 9.07.2023.
//

import Foundation
import UIKit

class CreditCartView : UIView {
    
    lazy var cartNumberTextField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "XXXX XXXX XXXX XXXX"
        textfield.borderStyle = .none
        textfield.keyboardType = .numberPad
        return textfield
    }()
    lazy var monthTextField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "MM"
        textfield.borderStyle = .none
        textfield.keyboardType = .numberPad
        textfield.font = UIFont.systemFont(ofSize: 18)
        return textfield
    }()
    lazy var yearTextField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "YY"
        textfield.borderStyle = .none
        textfield.keyboardType = .numberPad
        textfield.font = UIFont.systemFont(ofSize: 18)
        return textfield
    }()
    lazy var ccvTextField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "XXX"
        textfield.borderStyle = .none
        textfield.keyboardType = .numberPad
        textfield.font = UIFont.systemFont(ofSize: 18)
        return textfield
    }()
    private lazy var enterTitle : UILabel = {
        let label = UILabel()
        label.text = "Enter you credit card."
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    
    private lazy var masterCardLogo : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mastercard")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 373, height: 197))
        addSubviews()
        backgroundColor = UIColor(red: 83/255, green: 185/255, blue: 207/255, alpha: 1)
        setupTitleConstraints()
        setupCCVTextFieldConstraints()
        setupYearTextFieldConstraints()
        setupMonthTextFieldConstraints()
        setupCardNumberTextFieldConstraints()
        setupMasterCardLogoConstraints()
        self.layer.cornerRadius = 24
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [masterCardLogo,enterTitle,cartNumberTextField,monthTextField,yearTextField,ccvTextField].forEach { v in
            addSubview(v)
        }
    }
    
    private func setupMasterCardLogoConstraints() {
        masterCardLogo.snp.makeConstraints { make in
            make.width.equalTo(63)
            make.height.equalTo(50)
            make.top.equalTo(self.snp.top).offset(20)
            make.trailing.equalTo(self.snp.trailing).inset(14)
        }
    }
    
    private func setupTitleConstraints() {
        enterTitle.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(20)
            make.leading.equalTo(self.snp.leading).offset(20)
            make.width.equalTo(245)
            make.height.equalTo(30)
        }
    }
    private func setupCardNumberTextFieldConstraints() {
        cartNumberTextField.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(20)
            make.top.equalTo(enterTitle.snp.bottom).offset(70)
            make.width.equalTo(270)
            make.height.equalTo(30)
        }
    }
    private func setupMonthTextFieldConstraints() {
        monthTextField.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(20)
            make.bottom.equalTo(self.snp.bottom).inset(14)
            make.trailing.equalTo(yearTextField.snp.leading).inset(12)
            make.width.equalTo(40)
            make.height.equalTo(30)
        }
    }
    private func setupYearTextFieldConstraints() {
        yearTextField.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottom).inset(14)
            make.leading.equalTo(monthTextField.snp.trailing).offset(12)
            make.width.equalTo(40)
            make.height.equalTo(30)
        }
    }
    private func setupCCVTextFieldConstraints() {
        ccvTextField.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottom).inset(14)
            make.leading.equalTo(yearTextField.snp.trailing).offset(161)
            make.width.equalTo(40)
            make.height.equalTo(30)
        }
    }
    
}
