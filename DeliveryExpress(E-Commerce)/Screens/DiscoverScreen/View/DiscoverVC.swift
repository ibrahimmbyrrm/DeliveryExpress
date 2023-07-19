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
            rootView.pageTitleLabel.text = pageTitle?.uppercased()
        }
    }
    lazy var productList = [Product]()
    lazy var categoryList = [String]()
    
    weak var presenter: DiscoverPresenterInterface?
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    //MARK: - Selector Methods
    @objc private func currentCategoryClicked() {
        rootView.callChangeCategoryAlert(ownerVC: self)
    }
    
}
//MARK: - Discover View Interface Methods
extension DiscoverVC : DiscoverViewInterface {
    
    func handlePresenterOutput(with output : DiscoverPresenterOutput) {
        switch output {
        case .categoriesLoaded(let categories):
            self.categoryList = categories
        case .productsLoaded(let products):
            self.productList = products
        }
        rootView.productsCollectionView.reloadData()
        rootView.activityIndicator.stopAnimating()
    }
    //MARK: - UIView Methods
    func setDelegates() {
        rootView.productsCollectionView.delegate = self
        rootView.productsCollectionView.dataSource = self
        rootView.searchBar.delegate = self
    }
    func setupNavigationBar() {
        self.navigationItem.titleView = rootView.searchBar
        self.navigationController?.navigationBar.barTintColor = UIColor(hexString: "071952")
        self.navigationController?.navigationBar.tintColor = UIColor(hexString: "071952")
    }
    func setupChangeCategoryButton() {
        rootView.changeCategory.addTarget(nil, action: #selector(currentCategoryClicked), for: .touchUpInside)
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
