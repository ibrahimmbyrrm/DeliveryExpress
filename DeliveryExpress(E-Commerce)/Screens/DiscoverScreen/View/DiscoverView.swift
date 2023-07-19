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
    lazy var searchBar = UISearchBar()
    lazy var productsCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 2
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.layer.cornerRadius = 12
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.HomeConstants.categCell)
        collectionView.backgroundColor = UIColor(hexString: "071952")
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: Constants.HomeConstants.prodCell)
        return collectionView
    }()
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .black
        return indicator
    }()
    lazy var changeCategory : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.DiscoverConstants.changeCategoryButtonTitle, for: .normal)
        return button
    }()
    lazy var pageTitleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.textColor = UIColor(hexString: "97FEED")
        return label
    }()
    //MARK: - Initial Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(hexString: "071952")
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
    //MARK: - Custom Alert Functions
    typealias DiscoverViewInterfaceVC = DiscoverViewInterface & BaseViewController<DiscoverView>
    
    func callChangeCategoryAlert(ownerVC : DiscoverViewInterfaceVC) {
        let alert = UIAlertController(title: "Change the Category", message: nil, preferredStyle: .actionSheet)
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        let allCategoriesButton = UIAlertAction(title: "All Products", style: .destructive) { _ in
            ownerVC.presenter?.handleViewOutput(with: .all)
            ownerVC.rootView.pageTitleLabel.text = "All Products"
        }
        alert.addAction(cancelButton)
        alert.addAction(allCategoriesButton)
        ownerVC.categoryList.forEach { category in
            let alertAction = UIAlertAction(title: category, style: .default) { _ in
                ownerVC.presenter?.handleViewOutput(with: .categoryChanged(category))
                ownerVC.rootView.pageTitleLabel.text = category.capitalized
            }
            
            alert.addAction(alertAction)
        }
        ownerVC.present(alert, animated: true)
    }
    //MARK: - Layout Functions
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
        searchBar.placeholder = Constants.DiscoverConstants.searchBarPlaceholder
        searchBar.backgroundColor = UIColor(hexString: "071952")
    }
}
