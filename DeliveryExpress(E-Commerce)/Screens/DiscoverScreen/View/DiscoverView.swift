//
//  DiscoverView.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 6.07.2023.
//

import Foundation
import UIKit

class DiscoverView : UIView {
    //MARK: - Programmatic UI Objects
    let searchBar = UISearchBar()
    let productsCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 2
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.layer.cornerRadius = 12
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.HomeConstants.categCell)
        collectionView.backgroundColor = .white
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: Constants.HomeConstants.prodCell)
        return collectionView
    }()
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .black
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    let changeCategory : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.DiscoverConstants.changeCategoryButtonTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let pageTitleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        setupCollectionViewConstraints()
        setupSearchBar()
        setupActivityIndicator()
        setupCurrentCategoryButtonConstraints()
        setupPageTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCurrentCategoryButtonConstraints() {
        changeCategory.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(8)
            make.top.equalTo(pageTitleLabel.snp.bottom)
            make.width.equalTo(120)
            make.height.equalTo(30)
        }
    }
    
    private func setupActivityIndicator() {
        activityIndicator.snp.makeConstraints { make in
            make.center.equalTo(self.snp.center)
        }
        activityIndicator.startAnimating()
    }
    
    private func setupPageTitleLabelConstraints() {
        pageTitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(45)
        }
    }
    
    private func addSubviews() {
        [productsCollectionView,changeCategory,pageTitleLabel,activityIndicator,].forEach { v in
            addSubview(v)
        }
    }
    
    private func setupCollectionViewConstraints() {
        productsCollectionView.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(self.snp.width)
            make.bottom.equalTo(self.snp.bottom)
            make.top.equalTo(changeCategory.snp.bottom).offset(10)
        }
        productsCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: Constants.HomeConstants.prodCell)
    }
    
    private func setupSearchBar() {
        searchBar.placeholder = "Find your product..."
        searchBar.backgroundColor = .white
    }
}
