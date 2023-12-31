//
//  BasketView++.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 6.07.2023.
//

import Foundation
import UIKit

class BasketView : UIView {
    
    lazy var cartTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(BasketCell.self, forCellReuseIdentifier: Constants.BasketConstants.basketCell)
        tableView.layer.cornerRadius = 12
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .black
        tableView.backgroundColor = UIColor(hexString: Constants.HexCodes.navy)
        return tableView
    }()

    lazy var totalCostStackView =  TotalCostStackView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(hexString: Constants.HexCodes.navy)
        addSubviews()
        setupTableViewConstraints()
        setupTotalCostStackViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    
    private func addSubviews() {
        [cartTableView,totalCostStackView].forEach { v in
            addSubview(v)
        }
    }
    private func setupTableViewConstraints() {
        cartTableView.snp.makeConstraints { make in
            make.leading.top.equalTo(self.safeAreaLayoutGuide)
            make.bottom.equalTo(totalCostStackView.snp.top)
            make.trailing.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    typealias AlertShowableBasketVC = BasketViewInterface & BaseViewController<BasketView>
    
    func checkTheBasketToClear(ownerVC : AlertShowableBasketVC) {
        if ownerVC.cartList.isEmpty {
            let customAlert = CustomAlertViewController(type: .cartEmpty)
            ownerVC.present(customAlert, animated: true)
        }else {
            let alert = UIAlertController(title: "Are you sure about cleaning the basket ?", message: nil, preferredStyle: .alert)
            let yesButton = UIAlertAction(title: "YES", style: .cancel) { _ in
                ownerVC.presenter?.handleViewOutput(output: .clearCart)
                let customAlert = CustomAlertViewController(type: .cartCleaned)
                ownerVC.present(customAlert, animated: true)
            }
            let noButton = UIAlertAction(title: "NO", style: .destructive)
            alert.addAction(yesButton)
            alert.addAction(noButton)
            ownerVC.present(alert, animated: true)
        }
    }
    
    private func setupTotalCostStackViewConstraints() {
        totalCostStackView.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(60)
        }
    }
}
