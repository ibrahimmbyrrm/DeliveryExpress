//
//  PaymentVC.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 9.07.2023.
//

import Foundation
import UIKit

class PaymentVC : BaseViewController<PaymentView> {
    
    var presenter: PaymentPresenterInterface?
    
    init(totalCost : Int) {
        super.init(nibName: nil, bundle: nil)
        ///Testing data transfer
        rootView.cardView.cartNumberTextField.text = "\(totalCost)"
        
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
        print(adress.country)
    }
}

