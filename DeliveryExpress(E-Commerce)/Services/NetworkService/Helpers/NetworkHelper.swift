//
//  NetworkHelper.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation

enum NetworkError : Error{
    case invalidUrl
    case invalidData
    case decodingError
    case unknownError
    case serverError
}
