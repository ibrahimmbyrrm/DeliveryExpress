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
        label.textAlignment = .center
        return label
    }()
    private let productImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    func configure(product : Product) {
        self.titleLabel.text = product.title
        self.productImageView.setImage(with: product.thumbnail)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [titleLabel,productImageView].forEach { v in
            contentView.addSubview(v)
        }
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.trailing.equalTo(contentView.snp.trailing).inset(5)
            make.height.equalTo(30)
        }
        productImageView.snp.makeConstraints { make in
            make.width.equalTo(110)
            make.height.equalTo(92)
            make.centerY.equalTo(contentView.snp.centerY)
            make.leading.equalTo(contentView.snp.leading).offset(5)
        }
    }
    

}
