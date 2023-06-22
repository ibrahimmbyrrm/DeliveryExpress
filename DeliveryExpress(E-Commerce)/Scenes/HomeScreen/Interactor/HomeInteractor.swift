//
//  HomeInteractor.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation

protocol HomeInteractorInterface {
    var presenter : HomePresenterInterface? {get set}
    func fetchData()
}

class HomeInteractor : HomeInteractorInterface {
    var presenter: HomePresenterInterface?
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        NetworkManager().fetchData(type: EndPointItems<[String]>.categories) { result in
            switch result {
            case .success(let categories):
                print(categories)
                self.presenter?.categoriesFethced(categories)
            case.failure(let erorr):
                print(erorr)
            }
        
        }
    }
}
