//
//  BasketView.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation
import UIKit

final class BasketVC : BaseViewController<BasketView>, PaymentButtonDelegate {

    var presenter: BasketPresenterInterface?
    
    lazy var cartList = [Product]() {
        didSet {
            rootView.cartTableView.reloadData()
            rootView.totalCostStackView.configureTotalCost(cart: cartList)
        }
    }
    //MARK: - UIViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
    }
    
    func callCurrentCart() {
        presenter?.handleViewOutput(output: .loadCart)
    }
    
    func goToPaymentClicked() {
        presenter?.handleViewOutput(output: .goToPaymentTapped(cartList))
    }
    //MARK: - Initial Setup Functions
    func setDelegates() {
        rootView.cartTableView.dataSource = self
        rootView.cartTableView.delegate = self
        rootView.totalCostStackView.delegate = self
    }
    
    func setupNavigationController() {
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: Constants.BasketConstants.clearButtonTitle, style: .done, target: self, action: #selector(clearCart))
        title = Constants.BasketConstants.title
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(hexString: Constants.HexCodes.mint)]
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    //MARK: - Selector Functions
    @objc func clearCart() {
        rootView.checkTheBasketToClear(ownerVC: self)
    }
    
}
//MARK: - Interface Methods
extension BasketVC : BasketViewInterface {
    func handlePresenterOutput(output: BasketPresenterOutput) {
        switch output {
        case .cartFetched(let cart):
            self.cartList = cart
            rootView.cartTableView.reloadData()
        }
    }
}
//MARK: - UITableView Methods
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
