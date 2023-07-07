//
//  BasketView++.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 6.07.2023.
//

import Foundation
import UIKit

class BasketView : UIView {
    
    let cartTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(BasketCell.self, forCellReuseIdentifier: "basketCell")
        tableView.layer.cornerRadius = 12
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .black
        return tableView
    }()
    
    let totalCostStackView =  TotalCostStackView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
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
    
    private func setupTotalCostStackViewConstraints() {
        totalCostStackView.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(60)
        }
    }
}
