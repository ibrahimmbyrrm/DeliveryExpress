//
//  PaymentContracts.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 9.07.2023.
//

import Foundation
import UIKit
//MARK: - Interfaces
protocol PaymentViewInterface {
    var presenter : PaymentPresenterInterface? {get set}
    func handlePresenterToViewOutput(with output : PaymentPresenterToViewOutput)
}
protocol PaymentInteractorInterface {
    var presenter : PaymentPresenterInterface? {get set}
    func handlePresenterToInteractorOutput(with output : PaymentPresenterToInteractorOutput)
}
protocol PaymentPresenterInterface {
    func handleInteractorOutput(with output : PaymentInteractorOutput)
    func handleViewOutput(with output : PaymentViewOutput)
}
protocol PaymentRouterInterface {
    var view : BaseViewController<PaymentView>? {get set}
    func navigateTo(to output: DiscoverRouterRotations)
}
//MARK: - Enums
enum PaymentBuildType {
    case withCart([Product])
    case withProduct(Product)
}
enum PaymentViewOutput {
    
}
enum PaymentPresenterToViewOutput {
    
}
enum PaymentInteractorOutput {
    
}
enum PaymentPresenterToInteractorOutput {
    
}

