//
//  ProductCell.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation
import UIKit
import Kingfisher

protocol priceButtonDelegate : AnyObject {
    func priceButtonClicked(_ index : Int)
}

class ProductCollectionViewCell: UICollectionViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    private let productImageView : UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    private let descriptionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    private let priceButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(rgb: 0xEF9440)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(priceButtonClicked), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    weak var delegate : priceButtonDelegate?
    var index : Int?
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupUI()
        setupConstraints()
    }
    
    func configure(with product : Product) {
        titleLabel.text = product.title
        descriptionLabel.text = product.description
        productImageView.setImage(with: product.images.first!)
        priceButton.setTitle("\(product.price)$ ▶", for: .normal)
        
    }
    
    private func addSubviews(){
        [titleLabel,descriptionLabel,productImageView,priceButton].forEach { v in
            contentView.addSubview(v)
        }
    }
    
    private func setupUI() {
        contentView.backgroundColor = .white
        layer.borderWidth = 4
        layer.borderColor = CGColor(red: 239/255, green: 148/255, blue: 64/255, alpha: 1)
    }
    
    private func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.width.equalTo(145)
            make.height.equalTo(92)
            make.top.equalTo(contentView.snp.top).offset(7)
            make.centerX.equalTo(contentView.snp.centerX)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(2.5)
            make.centerX.equalTo(contentView.snp.centerX)
            make.width.equalTo(160)
            make.height.equalTo(15)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.top.equalTo(titleLabel.snp.bottom).offset(2.5)
            make.width.equalTo(160)
            make.height.equalTo(23)
        }
        priceButton.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(20)
            make.trailing.equalTo(contentView.snp.trailing).offset(-6)
            make.bottom.equalTo(contentView.snp.bottom).offset(-6)
        }
    }
    
    @objc private func priceButtonClicked() {
        delegate?.priceButtonClicked(index ?? 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}