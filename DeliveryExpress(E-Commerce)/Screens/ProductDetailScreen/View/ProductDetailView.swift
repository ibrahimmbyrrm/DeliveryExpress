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
        collectionView.register(ProductImageCell.self, forCellWithReuseIdentifier: Constants.DetailConstants.imageCell)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private let detailsTitle : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = Constants.DetailConstants.detailTitle
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let buttonsStackView = DetailButtonsStackView()
    
    private let productDetailView = ProductDetailContainer()
    
    weak var presenter: ProductDetailPresenterInterface?
    var product : Product
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setDelegates()
        setupCollectionViewConstarints()
        setupProductContainerConstraints()
        setupButtonsStackViewConstraints()
        setupTitleConstraints()
        productDetailView.configureWith(with: product)
    }
    init(product : Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDelegates() {
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        buttonsStackView.delegate = self
    }
    
    private func addSubviews() {
        [detailsTitle,imageCollectionView,productDetailView,buttonsStackView].forEach { v in
            view.addSubview(v)
        }
    }
    
    private func setupTitleConstraints() {
        detailsTitle.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(imageCollectionView.snp.bottom).offset(2)
        }
    }
    
    private func setupButtonsStackViewConstraints() {
        buttonsStackView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(productDetailView.snp.bottom).offset(12)
            make.leading.equalTo(view.snp.leading).offset(12)
            make.trailing.equalTo(view.snp.trailing).offset(-12)
            make.height.equalTo(36)
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
        productDetailView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width)
            make.height.equalTo(154)
            make.top.equalTo(detailsTitle.snp.bottom).offset(4)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }
    }
    
}

extension ProductDetailView : DetailButtonsInterface {
    
    func addToCartClicked() {
        presenter?.handleViewOutput(with: .addToCart(self.product))
    }
    
    func goToPaymentClicked() {
            presenter?.handleViewOutput(with: .goToPayment(self.product))
    }

}

extension ProductDetailView : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.DetailConstants.imageCell, for: indexPath) as! ProductImageCell
        cell.productImageView.setImage(with: product.images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.images.count
    }
}
