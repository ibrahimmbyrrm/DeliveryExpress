//
//  MockProducts.swift
//  DeliveryExpress(E-Commerce)Tests
//
//  Created by İbrahim Bayram on 26.07.2023.
//

import Foundation
@testable import DeliveryExpress_E_Commerce_

enum MockProducts {
    static let mockProduct = Product(id: 1, title: "aa", description: "aa", price: 1, discountPercentage: 10, rating: 10, stock: 1, brand: "aa", category: "aa", thumbnail: "aa", images: ["",""])
    static let mockProduct2 = Product(id: 2, title: "bb", description: "bb", price: 2, discountPercentage: 20, rating: 20, stock: 2, brand: "bb", category: "bb", thumbnail: "bb", images: ["",""])
    static let mockProductList = [mockProduct,mockProduct2]
}
enum MockCategories {
    static let mockCategory = "Phones"
    static let mockCategory2 = "Laptops"
    static let mockCategoryList = [mockCategory,mockCategory2]
}
