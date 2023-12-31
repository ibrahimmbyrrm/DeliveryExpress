//
//  BasketContracts.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 1.07.2023.
//

import Foundation
import UIKit
//MARK: - Interfaces
protocol BasketViewInterface {
    var cartList : [Product] {get set}
    var presenter : BasketPresenterInterface? {get set}
    func setDelegates()
    func callCurrentCart()
    func setupNavigationController()
    func handlePresenterOutput(output : BasketPresenterOutput)
    
}
protocol BasketPresenterInterface : AnyObject{
    func handleInteractorOutput(output : BasketInteractorOutput)
    func viewDidLoad()
    func viewWillAppear()
    func handleViewOutput(output : BasketViewOutput)
}
protocol BasketInteractorInterface {
    var currentCart : [Product] {get set}
    var presenter : BasketPresenterInterface? {get set}
    func handlePresenterOutput(output : BasketPresenterToInteractorOutput)
}
protocol BasketRouterInterface {
    var view : UIViewController? {get set}
    func navigateTo(to rotation : BasketRotations)
}
//MARK: - Enums
enum BasketInteractorOutput {
    case cartFetched([Product])
}
enum BasketViewOutput {
    case loadCart
    case productClicked(Product)
    case deleteItem(Int)
    case clearCart
    case goToPaymentTapped([Product])
}
enum BasketPresenterOutput {
    case cartFetched([Product])
}
enum BasketRotations {
    case toProductDetail(Product)
    case toPaymentScreen([Product])
}
enum BasketPresenterToInteractorOutput {
    case loadAllItems
    case removeAtIndex(Int)
    case clearCart
}
