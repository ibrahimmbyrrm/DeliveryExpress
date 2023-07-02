//
//  BasketContracts.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 1.07.2023.
//

import Foundation
import UIKit

protocol BasketViewInterface {
    var presenter : BasketPresenterInterface? {get set}
    func handlePresenterOutput(output : BasketPresenterOutput)
    
}
protocol BasketPresenterInterface : AnyObject{
    func handleInteractorOutput(output : BasketInteractorOutput)
    func handleViewOutput(output : BasketViewOutput)
}
protocol BasketInteractorInterface {
    var presenter : BasketPresenterInterface? {get set}
    func handlePresenterOutput(output : BasketPresenterToInteractorOutput)
}
protocol BasketRouterInterface {
    var view : UIViewController? {get set}
    func navigateTo(to rotation : BasketRotations)
}
enum BasketInteractorOutput {
    case cartFetched([Product])
}
enum BasketViewOutput {
    case loadCart
    case productClicked(Product)
    case deleteItem(Int)
}
enum BasketPresenterOutput {
    case cartFetched([Product])
}
enum BasketRotations {
    case toProductDetail(Product)
    case toPaymentScreen
}
enum BasketPresenterToInteractorOutput {
    case loadAllItems
    case removeAtIndex(Int)
}
