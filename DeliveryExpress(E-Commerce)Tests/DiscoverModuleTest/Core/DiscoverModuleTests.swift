//
//  DiscoverModuleTests.swift
//  DeliveryExpress(E-Commerce)Tests
//
//  Created by İbrahim Bayram on 26.07.2023.
//

import XCTest
@testable import DeliveryExpress_E_Commerce_
final class DiscoverModuleTests: XCTestCase {
    
    private var presenter : DiscoverPresenter!
    private var mockInteractor : MockDiscoverInteractor!
    private var mockRouter : MockDiscoverRouter!
    private var mockView : MockDiscoverView!

    override func setUp(){
        super.setUp()
        mockInteractor = .init()
        mockRouter = .init()
        mockView = .init()
    }

    override func tearDown(){
        super.tearDown()
    }


}
