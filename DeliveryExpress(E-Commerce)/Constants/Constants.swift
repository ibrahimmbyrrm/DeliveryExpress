//
//  HomeConstants.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 6.07.2023.
//
import Foundation

enum Constants {
    static let UserDefaultsKey = "userCart"
    enum HomeConstants {
        static let prodCell = "ProductCell"
        static let categCell = "CategoryCell"
        static let prodTitle = "Popular Products"
        static let categTitle = "Popular Categories"
        static let seeAllTitle = "See All"
    }
    enum DetailConstants {
        static let imageCell = "ProductImageCell"
        static let detailTitle = "Product Details"
    }
    enum DiscoverConstants {
        static let changeCategoryButtonTitle = "Change Category"
        static let searchBarPlaceholder = "Find your product..."
    }
    enum BasketConstants {
        static let clearButtonTitle = "Clear"
        static let title = "Shopping Cart"
        static let basketCell = "basketCell"
        static let totalCostTitle = "Total Cost:"
    }
}
