//
//  DiscoverView.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 27.06.2023.
//

import Foundation
import UIKit

final class DiscoverVC : BaseViewController<DiscoverView> {
  //MARK: - Local Variables
    var pageTitle: String? {
        didSet {
            rootView.pageTitleLabel.text = pageTitle
        }
    }
    lazy var productList = [Product]()
    lazy var categoryList = [String]()
    
    weak var presenter: DiscoverPresenterInterface?
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = rootView.searchBar
        setDelegates()
        setupChangeCategoryButton()
    }
    //MARK: - UIView Methods
    private func setDelegates() {
        rootView.productsCollectionView.delegate = self
        rootView.productsCollectionView.dataSource = self
        rootView.searchBar.delegate = self
    }
    private func setupChangeCategoryButton() {
        rootView.changeCategory.addTarget(nil, action: #selector(currentCategoryClicked), for: .touchUpInside)
    }
    //MARK: - Selector Methods
    @objc private func currentCategoryClicked() {
        let alert = UIAlertController(title: "Change the Category", message: nil, preferredStyle: .actionSheet)
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        let allCategoriesButton = UIAlertAction(title: "All Products", style: .destructive) { _ in
            self.presenter?.handleViewOutput(with: .all)
            self.rootView.pageTitleLabel.text = "All Products"
        }
        alert.addAction(cancelButton)
        alert.addAction(allCategoriesButton)
        categoryList.forEach { category in
            let alertAction = UIAlertAction(title: category, style: .default) { _ in
                self.presenter?.handleViewOutput(with: .categoryChanged(category))
                self.rootView.pageTitleLabel.text = category.capitalized
            }
            
            alert.addAction(alertAction)
        }
        self.present(alert, animated: true)
    }
    
}
//MARK: - Discover View Interface Methods
extension DiscoverVC : DiscoverViewInterface {
    
    func handlePresenterOutput(with output : DiscoverPresenterOutput) {
        print("lşmdlmşg")
        switch output {
        case .categoriesLoaded(let categories):
            self.categoryList = categories
        case .productsLoaded(let products):
            self.productList = products
        }
        rootView.productsCollectionView.reloadData()
        rootView.activityIndicator.stopAnimating()
    }
    
}
//MARK: - SearchBar Methods
extension DiscoverVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.handleViewOutput(with: .fetchQueryResults(searchText))
        rootView.pageTitleLabel.text = searchText.capitalized
    }
}
//MARK: - CollectionView Methods
extension DiscoverVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
extension DiscoverVC : priceButtonDelegate {
    func priceButtonClicked(_ index: Int) {
        presenter?.handleViewOutput(with: .productClicked(productList[index]))
    }
}
