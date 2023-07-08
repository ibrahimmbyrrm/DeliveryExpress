//
//  SeeAllFooterView.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 28.06.2023.
//

import Foundation
import UIKit

protocol FooterDelegate : AnyObject {
    func seeAllClicked()
}

class FooterView: UICollectionReusableView {
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
    weak var delegate : FooterDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(button)
        // Button'un konumunu ve görünümünü ayarlamak için gerekli constraints'leri ekleyin veya layout yöntemlerini kullanın
        button.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(30)
            make.center.equalTo(self.snp.center)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func showAllButtonTapped() {
        delegate?.seeAllClicked()
    }
}
