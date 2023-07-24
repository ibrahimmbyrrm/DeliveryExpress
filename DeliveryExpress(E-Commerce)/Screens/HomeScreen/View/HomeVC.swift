//
//  HomeView.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation
import UIKit
import SnapKit

final class HomeVC : BaseViewController<HomeView> {
    
    //MARK: -Variables
    var presenter: HomePresenterInterface?
    var categoryList = [String]()
    var productList = [Product]()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        presenter?.handleViewOutput(with: .loadData)
    }
}
//MARK: - CollectionView Methods
extension HomeVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        setupCollectionViewFor(rootView: rootView, homeVC: self, indexPath: indexPath, collection: collectionView).sizeForItemAt
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        setupCollectionViewFor(rootView: rootView, homeVC: self, indexPath: nil, collection: collectionView).numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        setupCollectionViewFor(rootView: rootView, homeVC: self, indexPath: indexPath, collection: collectionView).cellForItemAt
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard collectionView == rootView.productCollectionView else {return UICollectionReusableView()}
        let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.HomeConstants.footerId, for: indexPath) as! FooterView
        footerView.delegate = self
        footerView.button.isHidden = rootView.activityIndicator.isAnimating
        return footerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        guard collectionView == rootView.productCollectionView else {return CGSize(width: 0, height: 0)}
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
    
    
}
//MARK: - UICollectionViewCell Button Actions
extension HomeVC : FooterDelegate,priceButtonDelegate, CategoryButtonDelegate {
    
    func seeAllClicked() {
        presenter?.handleViewOutput(with: .seeAllClicked)
    }
    
    func priceButtonClicked(_ index: Int) {
        presenter?.handleViewOutput(with: .productClicked(productList[index]))
    }
    
    func categoryClicked(_ index: Int) {
        presenter?.handleViewOutput(with: .categoryClicked(categoryList[index]))
    }
}
//MARK: - Interface Methods
extension HomeVC : HomeViewInterface {
    
    func setupNavigationBar() {
        self.title = Constants.HomeConstants.appTitle
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(hexString: "35A29F")]
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    //MARK: - Delegate Settings
    func setDelegates() {
        rootView.categoryCollectionView.delegate = self
        rootView.categoryCollectionView.dataSource = self
        rootView.productCollectionView.delegate = self
        rootView.productCollectionView.dataSource = self
    }
    
    func stopActivityIndicator() {
        rootView.activityIndicator.stopAnimating()
    }
    
    func saveData(with output: HomePresenterOutput) {
        switch output {
        case .saveCategories(let categories):
            self.categoryList = categories
            rootView.categoryCollectionView.reloadData()
        case .saveProducts(let products):
            self.productList = products
            rootView.productCollectionView.reloadData()
        }
    }
}



