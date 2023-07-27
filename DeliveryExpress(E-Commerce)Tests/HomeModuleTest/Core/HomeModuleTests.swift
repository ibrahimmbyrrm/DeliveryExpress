//
//  DeliveryExpress_E_Commerce_Tests.swift
//  DeliveryExpress(E-Commerce)Tests
//
//  Created by İbrahim Bayram on 25.07.2023.
//

import XCTest
@testable import DeliveryExpress_E_Commerce_

final class HomeModuleTests: XCTestCase {
    
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
        XCTAssertEqual(mockView.categoryList, [String]())
        //When
        presenter.handleInteractorOutput(with: .categoriesLoaded(MockCategories.mockCategoryList))
        //Then
        XCTAssertEqual(mockView.categoryList, MockCategories.mockCategoryList)
        XCTAssertTrue(mockView.invokedSaveCategoriesOutput)
    }
    
    func test_saveProducts_output_mockView() {
        //Given
        XCTAssertEqual(mockView.productList, [Product]())
        XCTAssertFalse(mockView.invokedSaveProductsOutput)
        //When
        presenter.handleInteractorOutput(with: .productsLoaded(MockProducts.mockProductList))
        //Then
        XCTAssertEqual(mockView.productList, MockProducts.mockProductList)
        XCTAssertTrue(mockView.invokedSaveProductsOutput)
    }
    
    func test_productSelected_mockRouter() {
        //Given
        XCTAssertFalse(mockRouter.invokedNavigateToDetail)
        XCTAssertNil(mockRouter.productToShowDetails)
        //When
        presenter.handleViewOutput(with: .productClicked(MockProducts.mockProduct))
        //Then
        XCTAssertEqual(mockRouter.productToShowDetails, MockProducts.mockProduct)
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
        XCTAssertNil(mockRouter.categoryToShowproducts)
        //When
        presenter.handleViewOutput(with: .categoryClicked(MockCategories.mockCategory))
        //Then
        XCTAssertEqual(mockRouter.categoryToShowproducts, MockCategories.mockCategory)
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



