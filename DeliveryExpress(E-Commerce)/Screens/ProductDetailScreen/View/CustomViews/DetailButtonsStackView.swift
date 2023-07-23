//
//  DetailButtonsStackView.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 27.06.2023.
//

import UIKit

class DetailButtonsStackView: UIStackView {

    private lazy var addToCartButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .orange
        button.setTitle("Add to Cart", for: .normal)
        button.backgroundColor = UIColor(hexString: Constants.HexCodes.customBlue)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(addToCartClicked), for: .touchUpInside)
        return button
    }()
    private lazy var goToPaymentButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go to Payment", for: .normal)
        button.backgroundColor = UIColor(hexString: Constants.HexCodes.customBlue)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(goToPaymentClicked), for: .touchUpInside)
        return button
    }()
    
    weak var delegate : DetailButtonsInterface?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackViewProperties()
        addSubviews()
        setupAddToCartButtonConstraints()
        setupGoToPaymentButtonConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - UI Functions
    private func configureStackViewProperties() {
        self.distribution = .equalCentering
        self.axis = .horizontal
    }
    
    private func addSubviews() {
        [addToCartButton,goToPaymentButton].forEach { v in
            addArrangedSubview(v)
        }
    }
    
    private func setupAddToCartButtonConstraints() {
        addToCartButton.snp.makeConstraints { make in
            make.width.equalTo(170)
            make.height.equalTo(36)
        }
    }
    
    private func setupGoToPaymentButtonConstraints() {
        goToPaymentButton.snp.makeConstraints { make in
            make.width.equalTo(170)
            make.height.equalTo(36)
        }
    }
    //MARK: - Selector Methods
    @objc func addToCartClicked() {
        delegate?.addToCartClicked()
    }
    @objc func goToPaymentClicked() {
        delegate?.goToPaymentClicked()
    }
}
