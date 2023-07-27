//
//  BasketModuleTests.swift
//  DeliveryExpress(E-Commerce)Tests
//
//  Created by İbrahim Bayram on 26.07.2023.
//

import XCTest
@testable import DeliveryExpress_E_Commerce_
final class BasketModuleTests: XCTestCase {

    private var presenter : BasketPresenter!
    private var mockView : MockBasketView!
    private var mockInteractor : MockBasketInteractor!
    private var mockRouter : MockBasketRouter!
    
    override func setUp() {
        super.setUp()
        mockView = .init()
        mockInteractor = .init()
        mockRouter = .init()
        presenter = .init(router: mockRouter, view: mockView, interactor: mockInteractor)
        mockInteractor.presenter = presenter
    }

    override func tearDown() {
        super.tearDown()
        presenter = nil
        mockView = nil
        mockRouter = nil
        mockInteractor = nil
    }
    func test_viewDidLoad_mockView() {
        //Given
        XCTAssertFalse(mockView.invokedSetDelegates)
        XCTAssertFalse(mockView.invokedSetupNavigationController)
        //When
        presenter.viewDidLoad()
        //Then
        XCTAssertTrue(mockView.invokedSetDelegates)
        XCTAssertTrue(mockView.invokedSetupNavigationController)
    }
    func test_viewWillAppear_mockViwe() {
        //Given
        XCTAssertFalse(mockView.invokedViewWillAppear)
        //When
        presenter.viewWillAppear()
        //Then
        XCTAssertTrue(mockView.invokedViewWillAppear)
    }
    
    func test_loadCart_mockView() {
        //Given
        XCTAssertEqual(mockInteractor.numberOfItemsInCart,0)
        XCTAssertEqual(mockInteractor.invokedLoadAllItemsOutputCount, 0)
        //When
        presenter.handleViewOutput(output: .loadCart)
        //Then
        XCTAssertGreaterThan(mockInteractor.numberOfItemsInCart, 0)
        XCTAssertEqual(mockInteractor.invokedLoadAllItemsOutputCount, 1)
    }
    func test_deleteItemAt_mockView() {
        //Given
        XCTAssertEqual(mockInteractor.numberOfItemsInCart,0)
        XCTAssertEqual(mockInteractor.invokedRemoveAtIndexOutputCount, 0)
        //When
        presenter.handleViewOutput(output: .loadCart)
        //Then
        XCTAssertEqual(mockInteractor.numberOfItemsInCart,2)
        //When
        presenter.handleViewOutput(output: .deleteItem(1))
        //Then
        XCTAssertEqual(mockInteractor.numberOfItemsInCart, 1)
        XCTAssertEqual(mockInteractor.invokedRemoveAtIndexOutputCount, 1)
    }
    func test_clearCart_mockView() {
        //Given
        presenter.handleViewOutput(output: .loadCart)
        XCTAssertEqual(mockInteractor.invokedClearCartOutputCount, 0)
        XCTAssertGreaterThan(mockInteractor.numberOfItemsInCart, 0)
        //When
        presenter.handleViewOutput(output: .clearCart)
        //Then
        XCTAssertEqual(mockInteractor.invokedClearCartOutputCount, 1)
        XCTAssertEqual(mockInteractor.numberOfItemsInCart, 0)
    }
    
    func test_goToPayment_whenCartIsEmpty_mockRouter() {
        //Given
        XCTAssertFalse(mockRouter.invokedNavigateToPaymentScreen)
        //When
        presenter.handleViewOutput(output: .goToPaymentTapped([Product]()))
        //Then
        XCTAssertFalse(mockRouter.invokedNavigateToPaymentScreen)
    }
    
    func test_goToPayment_withFilledCart_mockRouter() {
        //Given
        XCTAssertFalse(mockRouter.invokedNavigateToPaymentScreen)
        //When
        presenter.handleViewOutput(output: .goToPaymentTapped([MockProducts.mockProduct]))
        //Then
        XCTAssertTrue(mockRouter.invokedNavigateToPaymentScreen)
    }
    
    func test_productSelected_mockRouter() {
        //Given
        XCTAssertFalse(mockRouter.invokedNavigateToDetail)
        //When
        presenter.handleViewOutput(output: .productClicked(MockProducts.mockProduct))
        //Then
        XCTAssertTrue(mockRouter.invokedNavigateToDetail)
    }

}
