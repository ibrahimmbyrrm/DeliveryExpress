//
//  BasketView.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation
import UIKit

final class BasketVC : BaseViewController<BasketView> {

    var presenter: BasketPresenterInterface?
    
    lazy var cartList = [Product]() {
        didSet {
            rootView.cartTableView.reloadData()
            rootView.totalCostStackView.configureTotalCost(cart: cartList)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setupNavigationController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.handleViewOutput(output: .loadCart)
    }

    private func setDelegates() {
        rootView.cartTableView.dataSource = self
        rootView.cartTableView.delegate = self
    }
    
    private func setupNavigationController() {
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: Constants.BasketConstants.clearButtonTitle, style: .done, target: self, action: #selector(clearCart))
        title = Constants.BasketConstants.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    @objc func clearCart() {
        rootView.checkTheBasketToClear(ownerVC: self)
    }
    
}
extension BasketVC : BasketViewInterface {
    func handlePresenterOutput(output: BasketPresenterOutput) {
        switch output {
        case .cartFetched(let cart):
            self.cartList = cart
            rootView.cartTableView.reloadData()
        }
    }
}

extension BasketVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.BasketConstants.basketCell) as! BasketCell
        cell.layer.cornerRadius = 12
        cell.configure(product: cartList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.handleViewOutput(output: .productClicked(cartList[indexPath.row]))
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        editingStyle == .delete ? presenter?.handleViewOutput(output: .deleteItem(indexPath.row)) : nil
        tableView.reloadData()
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
