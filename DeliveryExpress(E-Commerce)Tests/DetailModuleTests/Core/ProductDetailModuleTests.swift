//
//  ProductDetailModuleTests.swift
//  DeliveryExpress(E-Commerce)Tests
//
//  Created by İbrahim Bayram on 27.07.2023.
//

import XCTest
@testable import DeliveryExpress_E_Commerce_
final class ProductDetailModuleTests: XCTestCase {
    
    private var presenter : ProductDetailPresenter!
    private var mockView : MockProductDetailView!
    private var mockInteractor : MockProductDetailInteractor!
    private var mockRouter : MockProductDetailRouter!
    
    override func setUp() {
        super.setUp()
        mockInteractor = .init()
        mockRouter = .init()
        mockView = .init(product: MockProducts.mockProduct)
        presenter = .init(interactor: mockInteractor, view: mockView, router: mockRouter)
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
        XCTAssertFalse(mockView.invokedSetupView)
        XCTAssertNil(mockView.rootViewConfigureationWith)
        //When
        presenter.viewDidLoad()
        //Then
        XCTAssertTrue(mockView.invokedSetDelegates)
        XCTAssertTrue(mockView.invokedSetupView)
        XCTAssertEqual(mockView.rootViewConfigureationWith,MockProducts.mockProduct)
    }
    
    func test_addToCart_mockIntertor() {
        //Given
        XCTAssertFalse(mockInteractor.invokedSaveToUserDefaults)
        XCTAssertNil(mockInteractor.productToBeSavedOnUserDefaults)
        //When
        presenter.handleViewOutput(with: .addToCart(MockProducts.mockProduct2))
        //Then
        XCTAssertTrue(mockInteractor.invokedSaveToUserDefaults)
        XCTAssertEqual(mockInteractor.productToBeSavedOnUserDefaults, MockProducts.mockProduct2)
    }
    
    func test_goToPayment_mockRouter() {
        //Given
        XCTAssertFalse(mockRouter.invokedNavigateToProductPayment)
        XCTAssertNil(mockRouter.productToBePaid)
        //When
        presenter.handleViewOutput(with: .goToPayment(MockProducts.mockProduct))
        //Then
        XCTAssertEqual(mockRouter.productToBePaid, MockProducts.mockProduct)
        XCTAssertTrue(mockRouter.invokedNavigateToProductPayment)
    }
    
    func test_addedToCart_mockView() {
        let expectation = XCTestExpectation(description: "productAddedToCart expectation")
        //Given
        XCTAssertFalse(mockView.invokedProductAddedToCart)
        //When
        presenter.handleInteractorOutput()
        //Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertTrue(self.mockView.invokedProductAddedToCart)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    
    
    
}
