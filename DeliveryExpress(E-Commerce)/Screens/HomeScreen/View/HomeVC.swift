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
    lazy var categoryList = [String]()
    lazy var productList = [Product]()
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Deviery Express"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = true
        setDelegates()
        presenter?.handleViewOutput(with: .loadData)
    }

    private func setDelegates() {
        rootView.categoryCollectionView.delegate = self
        rootView.categoryCollectionView.dataSource = self
        rootView.productCollectionView.delegate = self
        rootView.productCollectionView.dataSource = self
    }
    

}
    //MARK: - CollectionView Methods
extension HomeVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case rootView.categoryCollectionView:
            return CGSize(width: 140, height: 40)
        case rootView.productCollectionView:
            let width = (collectionView.frame.width - 30) / 2
            return CGSize(width: width, height: width)
        default:
            return CGSize.zero
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case rootView.productCollectionView:
            return productList.count
        case rootView.categoryCollectionView:
            return categoryList.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case rootView.productCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.HomeConstants.prodCell, for: indexPath) as! ProductCollectionViewCell
            cell.configure(with: productList[indexPath.row])
            cell.delegate = self
            cell.index = indexPath.row
            return cell
        case rootView.categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.HomeConstants.categCell, for: indexPath) as! CategoryCollectionViewCell
            cell.titleLabel.text = categoryList[indexPath.row].uppercased()
            cell.delegate = self
            cell.index = indexPath.row
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard collectionView == rootView.productCollectionView else {return UICollectionReusableView()}
        if kind == UICollectionView.elementKindSectionFooter {
                    let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FooterView", for: indexPath) as! FooterView
            footerView.delegate = self
            footerView.button.isHidden = rootView.activityIndicator.isAnimating
                    return footerView
                }
                return UICollectionReusableView()
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



