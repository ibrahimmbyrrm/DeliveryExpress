//
//  AddressInputStackView.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 9.07.2023.
//

import Foundation
import UIKit

protocol CompleteShoppingDelegate : AnyObject{
    func completeChopping(adress : Address)
}

class AddressInputStackView : UIStackView {
    
    private lazy var countryTF = AddressTextField(placeholder: "Your Country")
    private lazy var cityTF = AddressTextField(placeholder: "Your City")
    private lazy var districtTF = AddressTextField(placeholder: "Your District")
    private lazy var Street1TF = AddressTextField(placeholder: "Street 1")
    private lazy var Street2TF = AddressTextField(placeholder: "Street 2")
    private lazy var completeButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Complete Shopping", for: .normal)
        button.backgroundColor = UIColor(hexString: Constants.HexCodes.teal)
        button.tintColor = .black
        button.addTarget(nil, action: #selector(completeShoppingTapped), for: .touchUpInside)
        return button
    }()
    
    weak var delegate : CompleteShoppingDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addArrangedSubviews()
        setupStackViewProperties()
        setupCompleteButtonConstraints()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func completeShoppingTapped() {
        guard let city = cityTF.text,let district = districtTF.text, let county = countryTF.text, let st1 = Street1TF.text, let st2 = Street2TF.text else {return}
        let adress = Address(country: county, city: city, district: district, street1: st1, street2: st2)
        delegate?.completeChopping(adress: adress)
    }
    //MARK: - Layout Functions
    private func setupStackViewProperties() {
        distribution = .equalCentering
        spacing = 10
        axis = .vertical
    }
    
    private func setupCompleteButtonConstraints() {
        completeButton.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
    }
    
    private func addArrangedSubviews() {
        [countryTF,cityTF,districtTF,Street1TF,Street2TF,completeButton].forEach { v in
            addArrangedSubview(v)
        }
    }
    
}
