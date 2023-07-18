//
//  BasketViews.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 6.07.2023.
//

import Foundation
import UIKit

class HomeView : UIView {
    //MARK: - UI Objects
    
    lazy var categoryTitleLabel = TitleLabel(text: Constants.HomeConstants.categTitle)
    lazy var productTitleLabel = TitleLabel(text: Constants.HomeConstants.prodTitle)
    
    lazy var categoryCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 2
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.layer.cornerRadius = 12
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.HomeConstants.categCell)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var productCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: Constants.HomeConstants.prodCell)
        collectionView.register(FooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "FooterView")
        collectionView.contentInset.bottom = 50

        collectionView.layer.cornerRadius = 12
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .black
        return indicator
    }()
    //MARK: - Initial Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupActivityIndicator()
        setupCategoryTitlelabelConstraints()
        setupProductTitleLabelContstraints()
        setupProductCollectionViewConstraints()
        setupCategoryCollectionViewConstraints()
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Layout Functions
    private func addSubviews() {
    [productCollectionView,categoryCollectionView,categoryTitleLabel,productTitleLabel,activityIndicator].forEach { v in
        addSubview(v)
        }
    }
    
    private func setupActivityIndicator() {
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
        }
        activityIndicator.startAnimating()
    }
    
    private func setupCategoryCollectionViewConstraints() {
        categoryCollectionView.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.leading.equalTo(self.snp.leading).offset(8)
            make.trailing.equalTo(self.snp.trailing).offset(-8)
            make.top.equalTo(categoryTitleLabel.snp.bottom).offset(10)
        }
    }
    
    private func setupProductTitleLabelContstraints() {
        productTitleLabel.textColor = .white
        productTitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(categoryCollectionView.snp.bottom).offset(10)
        }
    }
    
    private func setupProductCollectionViewConstraints() {
        productCollectionView.snp.makeConstraints { make in
            make.top.equalTo(productTitleLabel.snp.bottom).offset(10)
            make.leading.equalTo(self.snp.leading).offset(8)
            make.trailing.equalTo(self.snp.trailing).offset(-8)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
       }
    }
    
    private func setupCategoryTitlelabelConstraints() {
        categoryTitleLabel.textColor = .white
        categoryTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalTo(self.snp.centerX)
        }
    }
    
}
