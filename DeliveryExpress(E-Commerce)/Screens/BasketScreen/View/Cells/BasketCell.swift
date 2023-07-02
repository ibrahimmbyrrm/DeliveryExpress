//
//  BasketCell.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 1.07.2023.
//

import UIKit

class BasketCell: UITableViewCell {
    
    private let titleLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .right
        label.textColor = .gray
        return label
    }()
    private let productImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let productPriceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .right
        label.textColor = .orange
        return label
    }()
    private let productBrandLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .right
        label.textColor = .black
        return label
    }()
    private let descriptionLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    func configure(product : Product) {
        self.titleLabel.text = product.title
        self.productImageView.setImage(with: product.thumbnail)
        self.productPriceLabel.text = "\(product.price)$"
        self.productBrandLabel.text = product.brand
        self.descriptionLabel.text = product.description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [titleLabel,productImageView,productPriceLabel,productBrandLabel,descriptionLabel].forEach { v in
            contentView.addSubview(v)
        }
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(12)
            make.trailing.equalTo(contentView.snp.trailing).inset(12)
            make.height.equalTo(20)
        }
        productImageView.snp.makeConstraints { make in
            make.width.equalTo(110)
            make.height.equalTo(100)
            make.centerY.equalTo(contentView.snp.centerY)
            make.leading.equalTo(contentView.snp.leading).offset(8)
        }
        productPriceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).inset(12)
            make.trailing.equalTo(contentView.snp.trailing).inset(12)
            make.height.equalTo(30)
        }
        productBrandLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.leading.equalTo(productImageView.snp.trailing).offset(12)
            make.trailing.equalTo(titleLabel.snp.leading).inset(20)
            make.height.equalTo(20)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(productImageView.snp.trailing).offset(12)
            make.trailing.equalTo(contentView.snp.trailing).inset(16)
            make.height.equalTo(32)
            make.width.equalTo(246)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
    }
    

}
