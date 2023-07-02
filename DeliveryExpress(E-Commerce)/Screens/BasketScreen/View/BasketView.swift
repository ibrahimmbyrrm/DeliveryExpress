//
//  BasketView.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation
import UIKit

class BasketView : UIViewController {
    
    private let cartTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(BasketCell.self, forCellReuseIdentifier: "basketCell")
        tableView.layer.cornerRadius = 12
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .black
        return tableView
    }()
    
    private let totalCostStackView =  TotalCostStackView()
    var presenter: BasketPresenterInterface?
    lazy var cartList = [Product]() {
        didSet {
            cartTableView.reloadData()
            totalCostStackView.configureTotalCost(cart: cartList)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setDelegates()
        setupTableViewConstraints()
        setupTotalCostStackViewConstraints()
        title = "Shopping Cart"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.handleViewOutput(output: .loadCart)
    }
    
    private func addSubviews() {
        [cartTableView,totalCostStackView].forEach { v in
            view.addSubview(v)
        }
    }
    
    private func setDelegates() {
        cartTableView.dataSource = self
        cartTableView.delegate = self
    }
    
    private func setupTableViewConstraints() {
        cartTableView.snp.makeConstraints { make in
            make.leading.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(totalCostStackView.snp.top)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setupTotalCostStackViewConstraints() {
        totalCostStackView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.snp.width)
        }
    }
}
extension BasketView : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basketCell") as! BasketCell
        cell.layer.cornerRadius = 12
        cell.configure(product: cartList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.handleViewOutput(output: .productClicked(cartList[indexPath.row]))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartList.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
 
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
    
extension BasketView : BasketViewInterface {
    func handlePresenterOutput(output: BasketPresenterOutput) {
        switch output {
        case .cartFetched(let cart):
            self.cartList = cart
            print("cart list geldi")
            self.cartTableView.reloadData()
        }
    }
    
    
}
