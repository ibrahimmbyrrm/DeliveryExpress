//
//  BasketView.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation
import UIKit

protocol BadgeChangable : AnyObject {
    func changeBadgeValue()
}

final class BasketVC : BaseViewController<BasketView>, BadgeChangable {

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
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Clear", style: .done, target: self, action: #selector(clearCart))
        title = "Shopping Cart"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.handleViewOutput(output: .loadCart)
    }

    private func setDelegates() {
        rootView.cartTableView.dataSource = self
        rootView.cartTableView.delegate = self
    }

    @objc func clearCart() {
        print("clear tapped")
        presenter?.handleViewOutput(output: .clearCart)
    }
    func changeBadgeValue() {
        if var badgeInt = Int(self.tabBarItem.badgeValue ?? "") {
            badgeInt += 1
            self.tabBarItem.badgeValue = "\(badgeInt)"
        }
        
    }
    
}
extension BasketVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basketCell") as! BasketCell
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
    
extension BasketVC : BasketViewInterface {
    func handlePresenterOutput(output: BasketPresenterOutput) {
        switch output {
        case .cartFetched(let cart):
            self.cartList = cart
            print("cart list geldi")
            rootView.cartTableView.reloadData()
        }
    }
}
