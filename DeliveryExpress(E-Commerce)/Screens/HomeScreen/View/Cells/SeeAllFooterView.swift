//
//  SeeAllFooterView.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 28.06.2023.
//

import Foundation
import UIKit

class FooterView: UICollectionReusableView {
    //MARK: - UI Objects
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.HomeConstants.seeAllTitle, for: .normal)
        button.addTarget(nil, action: #selector(showAllButtonTapped), for: .touchUpInside)
        button.backgroundColor = .orange
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.isHidden = true
        return button
    }()
    //MARK: - Local Variables
    weak var delegate : FooterDelegate?
    //MARK: - Initial Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(button)
        setupButtonConstraints()

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Layout Functions
    private func setupButtonConstraints() {
        button.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(30)
            make.center.equalTo(self.snp.center)
        }
    }
    //MARK: - Selector Methods
    @objc func showAllButtonTapped() {
        delegate?.seeAllClicked()
    }
}
