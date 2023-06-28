//
//  DiscoverView.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 27.06.2023.
//

import Foundation
import UIKit

class DiscoverView : UIViewController {
    //MARK: - Programmatic UI Objects
    private let searchBar = UISearchBar()
    private let productsCollectionView : UICollectionView = {
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
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .black
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    private let changeCategory : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change Category", for: .normal)
        button.addTarget(nil, action: #selector(currentCategoryClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let pageTitleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()  //MARK: - Local Variables
    var pageTitle: String? {
        didSet {
            self.pageTitleLabel.text = pageTitle
        }
    }
    var presenter: DiscoverPresenterInterface?
    lazy var productList = [Product]()
    lazy var categoryList = [String]()
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setDelegates()
        setupCollectionViewConstraints()
        setupSearchBar()
        setupActivityIndicator()
        setupCurrentCategoryButtonConstraints()
        setupPageTitleLabelConstraints()
    }
    //MARK: - Selector Methods
    @objc private func currentCategoryClicked() {
        let alert = UIAlertController(title: "Change the Category", message: nil, preferredStyle: .actionSheet)
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        let allCategoriesButton = UIAlertAction(title: "All Products", style: .destructive) { _ in
            self.presenter?.handleViewOutput(with: .all)
            self.pageTitleLabel.text = "All Products"
        }
        alert.addAction(cancelButton)
        alert.addAction(allCategoriesButton)
        categoryList.forEach { category in
            let alertAction = UIAlertAction(title: category, style: .default) { _ in
                self.presenter?.handleViewOutput(with: .categoryChanged(category))
                self.pageTitleLabel.text = category.capitalized
            }
            
            alert.addAction(alertAction)
        }
        
        
        
        self.present(alert, animated: true)
        
    }
    //MARK: - Layout Methods
    private func setupCurrentCategoryButtonConstraints() {
        changeCategory.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(8)
            make.top.equalTo(pageTitleLabel.snp.bottom)
            make.width.equalTo(120)
            make.height.equalTo(30)
        }
    }
    
    private func setupActivityIndicator() {
        activityIndicator.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
        }
        activityIndicator.startAnimating()
    }
    
    private func setupPageTitleLabelConstraints() {
        pageTitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(45)
        }
    }
    
    private func addSubviews() {
        [productsCollectionView,changeCategory,pageTitleLabel,activityIndicator,].forEach { v in
            view.addSubview(v)
        }
    }
    
    private func setupCollectionViewConstraints() {
        productsCollectionView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.snp.width)
            make.bottom.equalTo(view.snp.bottom)
            make.top.equalTo(changeCategory.snp.bottom).offset(10)
        }
        productsCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCell")
    }
    
    private func setDelegates() {
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        searchBar.delegate = self
    }
    
    private func setupSearchBar() {
        self.navigationItem.titleView = searchBar
        searchBar.placeholder = "Find your product..."
        searchBar.backgroundColor = .white
    }
    
    
    
}
//MARK: - Discover View Interface Methods
extension DiscoverView : DiscoverViewInterface {
    
    func handlePresenterOutput(with output : DiscoverPresenterOutput) {
        switch output {
        case .categoriesLoaded(let categories):
            self.categoryList = categories
        case .productsLoaded(let products):
            self.productList = products
        }
        self.productsCollectionView.reloadData()
        activityIndicator.stopAnimating()
    }
    
}
//MARK: - SearchBar Methods
extension DiscoverView : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.handleViewOutput(with: .fetchQueryResults(searchText))
        self.pageTitleLabel.text = searchText.capitalized
    }
}
//MARK: - CollectionView Methods
extension DiscoverView : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.HomeConstants.prodCell, for: indexPath) as! ProductCollectionViewCell
        cell.configure(with: productList[indexPath.row])
        cell.delegate = self
        cell.index = indexPath.row
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 30) / 2
        return CGSize(width: width, height: width)
    }
}
//MARK: - Cell Delegate Methods
extension DiscoverView : priceButtonDelegate {
    func priceButtonClicked(_ index: Int) {
        presenter?.handleViewOutput(with: .productClicked(productList[index]))
    }
}
