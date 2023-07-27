//
//  DeliveryExpress_E_Commerce_Tests.swift
//  DeliveryExpress(E-Commerce)Tests
//
//  Created by İbrahim Bayram on 25.07.2023.
//

import XCTest
@testable import DeliveryExpress_E_Commerce_

final class HomeModuleTests: XCTestCase {
    let mockProduct = Product(id: 1, title: "aa", description: "aa", price: 1, discountPercentage: 10, rating: 10, stock: 1, brand: "aa", category: "aa", thumbnail: "aa", images: ["",""])
    
    private var mockView : MockHomeView!
    private var presenter: HomePresenter!
    private var mockInteractor : MockHomeInteractor!
    private var mockRouter : MockHomeRouter!
    private var mockService : MockService!
    
    override func setUp() {
        super.setUp()
        // Test sırasında kullanılacak sınıfları ve değişkenleri hazırlayın
        mockView = .init()
        mockService = .init()
        mockInteractor = .init(service: mockService)
        mockRouter = .init()
        presenter = .init(interactor: mockInteractor, view: mockView, router: mockRouter)
        mockView.presenter = presenter
        mockInteractor.presenter = presenter
    }

    override func tearDown(){
        super.tearDown()
        presenter = nil
        mockView = nil
        mockRouter = nil
        mockInteractor = nil
    }

    func test_viewDidLoad_mockView() {
        //Given
        XCTAssertFalse(mockView.invokedSetDelegates)
        XCTAssertFalse(mockView.invokedSetupNavigationBar)
        //When
        presenter.viewDidLoad()
        //Then
        XCTAssertTrue(mockView.invokedSetDelegates)
        XCTAssertTrue(mockView.invokedSetupNavigationBar)
    }
    
    func test_saveCategpries_output_mockView() {
        //Given
        XCTAssertFalse(mockView.invokedSaveCategoriesOutput)
        //When
        presenter.handleInteractorOutput(with: .categoriesLoaded([""]))
        //Then
        XCTAssertTrue(mockView.invokedSaveCategoriesOutput)
    }
    
    func test_saveProducts_output_mockView() {
        //Given
        XCTAssertFalse(mockView.invokedSaveProductsOutput)
        //When
        presenter.handleInteractorOutput(with: .productsLoaded([mockProduct]))
        //Then
        XCTAssertTrue(mockView.invokedSaveProductsOutput)
    }
    
    func test_productSelected_mockRouter() {
        //Given
        XCTAssertFalse(mockRouter.invokedNavigateToDetail)
        //When
        presenter.handleViewOutput(with: .productClicked(mockProduct))
        //Then
        XCTAssertTrue(mockRouter.invokedNavigateToDetail)
    }
    
    func test_seeAll_output_mockRouter() {
        //Given
        XCTAssertFalse(mockRouter.invokedNavigateToAllProductsOutput)
        //When
        presenter.handleViewOutput(with: .seeAllClicked)
        //Then
        XCTAssertTrue(mockRouter.invokedNavigateToAllProductsOutput)
    }
    
    func test_categorySelected_output_mockRouter() {
        //Given
        XCTAssertFalse(mockRouter.invokedNavigateToCategoryOutput)
        //When
        presenter.handleViewOutput(with: .categoryClicked(""))
        //Then
        XCTAssertTrue(mockRouter.invokedNavigateToCategoryOutput)
    }
    
    func test_fetchData_interactor() {
        //Given
        XCTAssertFalse(mockInteractor.invokedFetchDataMethod)
        XCTAssertEqual(mockInteractor.productList,[Product]())
        XCTAssertEqual(mockInteractor.categoryList, [String]())
        XCTAssertEqual(mockInteractor.invokedFetchDataCount, 0)
        //When
        presenter.handleViewOutput(with: .loadData)
        //Then
        XCTAssertEqual(mockInteractor.invokedFetchDataCount, 2)
        XCTAssertTrue(mockInteractor.invokedFetchDataMethod)
        XCTAssertEqual(mockInteractor.categoryList, MockCategories.mockCategoryList)
        XCTAssertEqual(mockInteractor.productList,MockProducts.mockProductList)
    }
    
    func test_stopActivityIndicator_mockView() {
        //Given
        XCTAssertFalse(mockView.invokedStopActivityIndicator)
        //When
        presenter.handleViewOutput(with: .loadData)
        //Then
        XCTAssertTrue(mockView.invokedStopActivityIndicator)
    }
    
    func test_fetchData_mockService() {
        //Given
        XCTAssertFalse(mockService.invokedFetchDataService)
        XCTAssertEqual(mockService.invokedFetchDataServiceCount,0)
        //When
        mockInteractor.fetchData()
        XCTAssertTrue(mockService.invokedFetchDataService)
        XCTAssertEqual(mockService.invokedFetchDataServiceCount,2)
    }

}



