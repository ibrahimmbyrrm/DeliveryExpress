//
//  PaymentVC.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 9.07.2023.
//

import Foundation
import UIKit

class PaymentVC : BaseViewController<PaymentView>, UITextFieldDelegate {
    
    var presenter: PaymentPresenterInterface?
    
    init(totalCost : Int) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.addressStackView.delegate = self
    }
    
}
extension PaymentVC : PaymentViewInterface, CompleteShoppingDelegate {
    func handlePresenterToViewOutput(with output: PaymentPresenterToViewOutput) {
        
    }
    func completeChopping(adress: Address) {
        //presenter.handleViewOutput(with adress)
    }
}

