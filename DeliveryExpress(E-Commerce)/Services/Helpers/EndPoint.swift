//
//  EndPoint.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation


enum HTTPMethods : String {
    case get = "GET"
    case post = "POST"
}

protocol EndPointType {
    var path : String {get}
    var baseURL : String {get}
    var url : URL? {get}
    var method : HTTPMethods {get}
}

enum EndPointItems<T : Decodable> {
    case products
    case categories
}

extension EndPointItems : EndPointType{
    var path: String {
        switch self {
        case.products :
            return ""
        case .categories:
            return "categories"
        }
    }
    
    var baseURL: String {
        return "https://dummyjson.com/products/"
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethods {
        switch self {
        case.products:
            return .get
        case .categories:
            return .get
        }
    }
}
