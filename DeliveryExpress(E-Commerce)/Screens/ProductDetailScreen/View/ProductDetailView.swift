//
//  ProductDetailView.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 26.06.2023.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class ProductDetailView : UIViewController, ProductDetailViewInterface {
    
    private let imageCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.layer.borderWidth = 5
        collectionView.register(ProductImageCell.self, forCellWithReuseIdentifier: "ProductImageCell")
        collectionView.backgroundColor = .white
        return collectionView
    }()
    private let contaniner = ProductDetailContainer()
    
    var images = [String]()
    var presenter: ProductDetailPresenterInterface?
    var product : Product {
        didSet {
            print(product.images)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        setupCollectionViewConstarints()
        setupProductContainerConstraints()
        contaniner.configureWith(with: product)
       
    }
    init(product : Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [imageCollectionView,contaniner].forEach { v in
            view.addSubview(v)
        }
    }
    private func setupCollectionViewConstarints() {
        imageCollectionView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width)
            make.height.equalTo(200)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    private func setupProductContainerConstraints() {
        contaniner.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width)
            make.height.equalTo(154)
            make.top.equalTo(imageCollectionView.snp.bottom).offset(4)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }
    }
    
}
extension ProductDetailView : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductImageCell", for: indexPath) as! ProductImageCell
        cell.productImageView.kf.setImage(with: product.images[indexPath.row].asUrl())
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.images.count
    }
}
