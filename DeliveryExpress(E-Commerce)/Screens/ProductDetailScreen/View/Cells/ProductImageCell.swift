//
//  ProductImageCell.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 26.06.2023.
//

import UIKit

class ProductImageCell: UICollectionViewCell {
    
    lazy var productImageView : UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(productImageView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.width.equalTo(self.snp.width)
            make.height.equalTo(self.snp.height)
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
        }
    }
    
    
}
