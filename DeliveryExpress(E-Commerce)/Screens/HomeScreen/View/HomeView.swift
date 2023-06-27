//
//  HomeView.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation
import UIKit
import SnapKit

enum HomeViewOutput {
    case productClicked(Product)
    case categoryClicked(String)
    case loadData
}

class HomeView : UIViewController {
    //MARK: - Programmatic UI Objects
    private let categoryTitleLabel = TitleLabel(text: Constants.HomeConstants.categTitle)
    
    private let productTitleLabel = TitleLabel(text: Constants.HomeConstants.prodTitle)
    
    private var categoryCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 2
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.layer.cornerRadius = 12
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.HomeConstants.categCell)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private var productCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: Constants.HomeConstants.prodCell)
        collectionView.layer.cornerRadius = 12
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .black
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    //MARK: -Variables
    var presenter: HomePresenterInterface?
    var categoryList = [String]()
    var productList = [Product]()
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        self.title = "Deviery Express"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = true
        setDelegates()
        addSubviews()
        setupCategoryCollectionViewConstraints()
        setupProductCollectionViewConstraints()
        setupCategoryTitlelabelConstraints()
        setupProductTitleLabelContstraints()
        setupActivityIndicator()
        presenter?.handleViewOutput(with: .loadData)
    }
    //MARK: - UI Configurations
    
    private func addSubviews() {
    [productCollectionView,categoryCollectionView,categoryTitleLabel,productTitleLabel,activityIndicator].forEach { v in
        view.addSubview(v)
        }
    }
    
    private func setDelegates() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
    }
    
    private func setupActivityIndicator() {
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        }
        activityIndicator.startAnimating()
        
    }
    
    private func setupCategoryCollectionViewConstraints() {
        categoryCollectionView.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.leading.equalTo(view.snp.leading).offset(8)
            make.trailing.equalTo(view.snp.trailing).offset(-8)
            make.top.equalTo(categoryTitleLabel.snp.bottom).offset(10)
        }
    }
    
    private func setupProductTitleLabelContstraints() {
        productTitleLabel.textColor = .white
        productTitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(categoryCollectionView.snp.bottom).offset(10)
        }
    }
    
    private func setupProductCollectionViewConstraints() {
        productCollectionView.snp.makeConstraints { make in
            make.top.equalTo(productTitleLabel.snp.bottom).offset(10)
            make.leading.equalTo(view.snp.leading).offset(8)
            make.trailing.equalTo(view.snp.trailing).offset(-8)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
       }
    }
    
    private func setupCategoryTitlelabelConstraints() {
        categoryTitleLabel.textColor = .white
        categoryTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
}
    //MARK: - CollectionView Methods
extension HomeView : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case categoryCollectionView:
            return CGSize(width: 140, height: 40)
        case productCollectionView:
            let width = (collectionView.frame.width - 30) / 2
            return CGSize(width: width, height: width)
        default:
            return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case productCollectionView:
            return productList.count
        case categoryCollectionView:
            return categoryList.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case productCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.HomeConstants.prodCell, for: indexPath) as! ProductCollectionViewCell
            cell.configure(with: productList[indexPath.row])
            cell.delegate = self
            cell.index = indexPath.row
            return cell
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.HomeConstants.categCell, for: indexPath) as! CategoryCollectionViewCell
            cell.titleLabel.text = categoryList[indexPath.row].uppercased()
            cell.delegate = self
            cell.index = indexPath.row
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
    //MARK: - UICollectionViewCell Button Actions
extension HomeView : priceButtonDelegate, CategoryButtonDelegate {
    
    func priceButtonClicked(_ index: Int) {
        presenter?.handleViewOutput(with: .productClicked(productList[index]))
    }
    
    func categoryClicked(_ index: Int) {
        presenter?.handleViewOutput(with: .categoryClicked(categoryList[index]))
    }
}
    //MARK: - Interface Methods
extension HomeView : HomeViewInterface {
    
    func stopActivityIndicator() {
        self.activityIndicator.stopAnimating()
    }
    
    func saveData(with output: HomePresenterOutput) {
        switch output {
        case .saveCategories(let categories):
            self.categoryList = categories
            self.categoryCollectionView.reloadData()
        case .saveProducts(let products):
            self.productList = products
            self.productCollectionView.reloadData()
        }
    }
}



