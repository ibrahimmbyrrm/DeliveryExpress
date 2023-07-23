//
//  UIViewController+Extension.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 28.06.2023.
//

import Foundation
import UIKit

typealias HomeViewAndVC = HomeViewInterface & CategoryButtonDelegate & priceButtonDelegate

extension UIViewController {
    
    func embedNavigationController() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
    
}

extension UIViewController {
    
    ///Use only one method to create ang using all collection view properties for our two collectionView.
    ///This way prevent us from code repeats.Espacially switch case repeats.
    func setupCollectionViewFor(rootView : HomeView,homeVC : HomeViewAndVC,indexPath: IndexPath?, collection: UICollectionView) -> CollectionViewCellType {
        let itemSize: CGSize
        let itemNumber: Int
        let cell: UICollectionViewCell
        if let indexPath = indexPath {
            switch collection {
            case rootView.categoryCollectionView:
                itemSize = CGSize(width: 140, height: 40)
                itemNumber = homeVC.productList.count
                cell = collection.dequeueReusableCell(withReuseIdentifier: Constants.HomeConstants.categCell, for: indexPath) as! CategoryCollectionViewCell
                (cell as? CategoryCollectionViewCell)?.titleLabel.text = homeVC.categoryList[indexPath.row].uppercased()
            case rootView.productCollectionView:
                
                let width = (collection.frame.width - 30) / 2
                itemSize = CGSize(width: width, height: width)
                itemNumber = homeVC.categoryList.count
                cell = collection.dequeueReusableCell(withReuseIdentifier: Constants.HomeConstants.prodCell, for: indexPath) as! ProductCollectionViewCell
                (cell as? ProductCollectionViewCell)?.configure(with: homeVC.productList[indexPath.row])
            default:
                itemSize = CGSize(width: 0, height: 0)
                itemNumber = 0
                cell = UICollectionViewCell()
            }
        } else {
            switch collection {
            case rootView.categoryCollectionView:
                itemSize = CGSize(width: 0, height: 0)
                itemNumber = homeVC.categoryList.count
                cell = UICollectionViewCell()
            case rootView.productCollectionView:
                itemSize = CGSize(width: 0, height: 0)
                itemNumber = homeVC.productList.count
                cell = UICollectionViewCell()
            default:
                itemSize = CGSize(width: 0, height: 0)
                itemNumber = 0
                cell = UICollectionViewCell()
            }
        }
        
        if let categoryCell = cell as? CategoryCollectionViewCell {
            categoryCell.delegate = homeVC
            categoryCell.index = indexPath?.row ?? 0
        } else if let productCell = cell as? ProductCollectionViewCell {
            productCell.delegate = homeVC
            productCell.index = indexPath?.row ?? 0
        }
        
        return CollectionViewCellType(numberOfItemsInSection: itemNumber, cellForItemAt: cell, sizeForItemAt: itemSize)
    }
}
