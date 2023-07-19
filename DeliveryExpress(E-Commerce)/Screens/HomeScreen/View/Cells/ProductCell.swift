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
    //MARK: - UI Objects
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    private lazy var productImageView : UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    private lazy var descriptionLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    private lazy var priceButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(hexString: "071952")
        button.addTarget(nil, action: #selector(priceButtonClicked), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    //MARK: - Local Variables
    weak var delegate : priceButtonDelegate?
    var index : Int?
    //MARK: - Initial Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupUI()
        setupProductImageViewConstraints()
        setupTitleLabelConstraints()
        setupDescriptionLabelConstraints()
        setupPriceButtonConstraints()
    }
    
    func configure(with product : Product) {
        titleLabel.text = product.title
        descriptionLabel.text = product.description
        productImageView.setImage(with: product.images.first!)
        priceButton.setTitle("\(product.price)$ ▶", for: .normal)
        
    }
    //MARK: - Layout Functions
    private func addSubviews(){
        [titleLabel,descriptionLabel,productImageView,priceButton].forEach { v in
            contentView.addSubview(v)
        }
    }
    
    private func setupUI() {
        contentView.backgroundColor = .white
        layer.borderWidth = 4
        layer.borderColor = CGColor(red: 53/255, green: 162/255, blue: 159/255, alpha: 1)
    }
    
    private func setupProductImageViewConstraints() {
        productImageView.snp.makeConstraints { make in
            make.width.equalTo(145)
            make.height.equalTo(92)
            make.top.equalTo(contentView.snp.top).offset(7)
            make.centerX.equalTo(contentView.snp.centerX)
        }
    }
    
    private func setupTitleLabelConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(2.5)
            make.centerX.equalTo(contentView.snp.centerX)
            make.width.equalTo(160)
            make.height.equalTo(15)
        }
    }
    
    private func setupDescriptionLabelConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.top.equalTo(titleLabel.snp.bottom).offset(2.5)
            make.width.equalTo(160)
            make.height.equalTo(23)
        }
    }
    
    private func setupPriceButtonConstraints() {
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
