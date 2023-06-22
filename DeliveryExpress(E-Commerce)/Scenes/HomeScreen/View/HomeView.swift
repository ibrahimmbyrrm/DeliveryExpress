//
//  HomeView.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation
import UIKit
import SnapKit

protocol HomeViewInterface {
    var presenter : HomePresenterInterface? {get set}
    
    func saveCategories(_ categories : [String])
}

typealias EntryPoint = HomeViewInterface & UIViewController


class HomeView : EntryPoint {
    
    private let categoryTitleLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 1
        label.textColor = .black
        label.text = "Popular Categories"
        return label
    }()
    
    private let productTitleLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 1
        label.textColor = .black
        label.text = "Popular Products"
        return label
    }()
    
    private var categoryCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 2
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.layer.cornerRadius = 12
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCell")
        collectionView.backgroundColor = .gray
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
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCell")
        collectionView.layer.cornerRadius = 12
        collectionView.backgroundColor = .gray
        return collectionView
    }()
    
    var presenter: HomePresenterInterface?
    var categoryList = [String]() {
        didSet {
            DispatchQueue.main.async {
                self.categoryCollectionView.reloadData()
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setDelegates()
        addSubviews()
        setupCategoryCollectionViewConstraints()
        setupProductCollectionViewConstraints()
        setupCategoryTitlelabelConstraints()
        setupProductTitleLabelContstraints()
    }
    func saveCategories(_ categories: [String]) {
        self.categoryList = categories
        print(categories)
    }
    
    private func addSubviews() {
    [productCollectionView,categoryCollectionView,categoryTitleLabel,productTitleLabel].forEach { v in
        view.addSubview(v)
    }
}
    
    private func setDelegates() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
    }
    
    private func setupCategoryCollectionViewConstraints() {
        view.addSubview(categoryCollectionView)
        categoryCollectionView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.leading.equalTo(view.snp.leading).offset(8)
            make.trailing.equalTo(view.snp.trailing).offset(-8)
            make.top.equalTo(categoryTitleLabel.snp.bottom).offset(10)
        }
    }
    
    private func setupProductTitleLabelContstraints() {
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
        categoryTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
}
extension HomeView : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case categoryCollectionView: return CGSize(width: 140, height: 60)
        case productCollectionView:
            let width = (collectionView.frame.width - 30) / 2
            return CGSize(width: width, height: width)
        default:
            let width = (collectionView.frame.width - 30) / 2
            return CGSize(width: width, height: width)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case productCollectionView: return 15
        case categoryCollectionView: return categoryList.count
        default: return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case productCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath)
            return cell
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
            cell.titleLabel.text = categoryList[indexPath.row]
            cell.layer.cornerRadius = 12
            cell.clipsToBounds = false
            return cell
        default: return UICollectionViewCell()
        }
    }
}



