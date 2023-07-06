//
//  ProductDetailView.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 6.07.2023.
//

import Foundation
import UIKit

class ProductDetailView : UIView {
    //MARK: - UI Objects
    let imageCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.register(ProductImageCell.self, forCellWithReuseIdentifier: Constants.DetailConstants.imageCell)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    let detailsTitle : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = Constants.DetailConstants.detailTitle
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buttonsStackView = DetailButtonsStackView()
    
    let productDetailView = ProductDetailContainer()
    //MARK: - UIView Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        setupCollectionViewConstarints()
        setupProductContainerConstraints()
        setupButtonsStackViewConstraints()
        setupTitleConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //Configure all ui objects for selected product
    func configure(with product :  Product) {
        productDetailView.configureWith(with: product)
    }
    //MARK: - UI Methods(AddSubviews and Constraints)
    private func addSubviews() {
        [detailsTitle,imageCollectionView,productDetailView,buttonsStackView].forEach { v in
            addSubview(v)
        }
    }
    
    private func setupTitleConstraints() {
        detailsTitle.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(imageCollectionView.snp.bottom).offset(2)
        }
    }
    
    private func setupButtonsStackViewConstraints() {
        buttonsStackView.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(productDetailView.snp.bottom).offset(12)
            make.leading.equalTo(self.snp.leading).offset(12)
            make.trailing.equalTo(self.snp.trailing).offset(-12)
            make.height.equalTo(36)
        }
    }
    
    private func setupCollectionViewConstarints() {
        imageCollectionView.snp.makeConstraints { make in
            make.width.equalTo(self.snp.width)
            make.height.equalTo(200)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
        }
    }
    
    private func setupProductContainerConstraints() {
        productDetailView.snp.makeConstraints { make in
            make.width.equalTo(self.snp.width)
            make.height.equalTo(154)
            make.top.equalTo(detailsTitle.snp.bottom).offset(4)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
        }
    }
    
}
