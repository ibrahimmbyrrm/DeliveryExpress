//
//  ProductDetailContainer.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 26.06.2023.
//

import UIKit

class ProductDetailContainer: UIView {

    private let brandLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints
        label.text = "Apple"
        return label
    }()
    private let modelLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Iphone X"
        return label
    }()
    private let descriptionLabel : UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "An apple mobile which is nothing like apple"
        return label
    }()
    private let ratingLabel : UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "4.8"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    private let stockLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Stock : 64"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    private let priceLabel : UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.backgroundColor = .white
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "999$"
        label.textAlignment = .center
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupBrandLabelConstraints()
        self.backgroundColor = UIColor(red: 1, green: 168/255, blue: 0, alpha: 0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureWith(with product : Product) {
        brandLabel.text = product.brand
        modelLabel.text = product.title
        descriptionLabel.text = product.description
        ratingLabel.text = "\(product.rating)"
        stockLabel.text = "Stock : \(product.stock)"
        priceLabel.text = "\(product.price)$"
    }
    
    private func setupBrandLabelConstraints() {
        brandLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(12)
            make.height.equalTo(20)
            make.leading.equalTo(self.snp.leading).offset(12)
        }
        modelLabel.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).offset(-12)
            make.leading.equalTo(brandLabel.snp.trailing).offset(1)
            make.height.equalTo(20)
            make.top.equalTo(self.snp.top).offset(12)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(12)
            make.trailing.equalTo(self.snp.trailing).offset(-12)
            make.top.equalTo(modelLabel.snp.bottom).offset(12)
            make.width.equalTo(390)
        }
        ratingLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(12)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(12)
            make.height.equalTo(20)
        }
        stockLabel.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).offset(-100)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(12)
            make.height.equalTo(20)
        }
        priceLabel.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).offset(-12)
            make.bottom.equalTo(self.snp.bottom).offset(-12)
        }
    }
    
    private func addSubviews() {
        [brandLabel,modelLabel,descriptionLabel,ratingLabel,stockLabel,priceLabel].forEach { v in
            self.addSubview(v)
        }
    }
}
