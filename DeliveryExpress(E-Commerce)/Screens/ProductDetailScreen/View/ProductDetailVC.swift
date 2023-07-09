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

final class ProductDetailVC : BaseViewController<ProductDetailView>, ProductDetailViewInterface {
    
    weak var presenter: ProductDetailPresenterInterface?
    var product : Product
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        rootView.configure(with: product)
    }
    init(product : Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDelegates() {
        rootView.imageCollectionView.delegate = self
        rootView.imageCollectionView.dataSource = self
        rootView.buttonsStackView.delegate = self
    }
    func productAddedToCart() {
        rootView.callProductAddedAlert(ownerVC: self)
    }
    /// Payment Ekranında Kart Numarasının düzgün görünmesini bu metodla sağlayacağız.
    private func formatCardNumber(_ cardNumber: String) -> String {
            var formattedString = ""
            // Kart numarasını "XXXX XXXX XXXX XXXX" formatına uygun hale getirin
            for (index, character) in cardNumber.enumerated() {
                if index > 0 && index % 4 == 0 {
                    formattedString.append(" ")
                }
                formattedString.append(character)
            }
            
            return formattedString
    }
}

extension ProductDetailVC : DetailButtonsInterface {
    
    func addToCartClicked() {
        presenter?.handleViewOutput(with: .addToCart(self.product))
    }
    
    func goToPaymentClicked() {
        self.present(PaymentBuilder.buildModule(with: .withProduct(self.product)), animated: true)
        presenter?.handleViewOutput(with: .goToPayment(self.product))
    }
    
}

extension ProductDetailVC : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
