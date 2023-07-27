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
        XCTAssertFalse(mockInteractor.invokedFetchProducts)
        XCTAssertFalse(mockInteractor.invokedFetchCategories)
        //When we initialize the presenter by all products, presenter calls itneractor to fetch products.
        presenter = .init(type: .allProducts, interactor: mockInteractor, view: mockView, router: mockRouter)
        mockView.presenter = presenter
        mockInteractor.presenter = presenter
    }

    override func tearDown(){
        super.tearDown()
        mockView = nil
        mockRouter = nil
        mockInteractor = nil
        presenter = nil
    }
    
    func test_viewDidLoad_mockView() {
        //Given
        XCTAssertFalse(mockView.invokedSetupChangeCategoryButton)
        XCTAssertEqual(mockView.invokedSetupChangeCategoryButtonCount, 0)
        XCTAssertEqual(mockView.invokedSetDelegatesCount, 0)
        XCTAssertFalse(mockView.invokedSetDelegates)
        XCTAssertEqual(mockView.invokedSetupNavigationBarCount, 0)
        XCTAssertFalse(mockView.invokedSetupNavigationBar)
        //When
        presenter.viewDidLoad()
        //Then
        XCTAssertTrue(mockView.invokedSetupChangeCategoryButton)
        XCTAssertEqual(mockView.invokedSetupChangeCategoryButtonCount, 1)
        XCTAssertEqual(mockView.invokedSetDelegatesCount, 1)
        XCTAssertTrue(mockView.invokedSetDelegates)
        XCTAssertEqual(mockView.invokedSetupNavigationBarCount, 1)
        XCTAssertTrue(mockView.invokedSetupNavigationBar)
    }
    func test_handlePresenterOutput_categoriesLoaded_mockView() {
        //Given
        XCTAssertEqual(mockView.invokedCategoriesLoadedOutputCount, 0)
        XCTAssertFalse(mockView.invokedCategoriesLoadedOutput)
        XCTAssertEqual(mockView.categoryList, [String]())
        //When
        presenter.handleInteractorOutput(with: .categoriesLoaded(MockCategories.mockCategoryList))
        //Then
        XCTAssertEqual(mockView.invokedCategoriesLoadedOutputCount, 1)
        XCTAssertTrue(mockView.invokedCategoriesLoadedOutput)
        XCTAssertEqual(mockView.categoryList,MockCategories.mockCategoryList)
    }
    func test_handlePresenterOutput_productsLoaded_mockView() {
        //Given
        XCTAssertEqual(mockView.invokedProductsLoadedOutputCount, 0)
        XCTAssertFalse(mockView.invokedProductsLoadedOutput)
        XCTAssertEqual(mockView.productList, [Product]())
        //When
        presenter.handleInteractorOutput(with: .productsLoaded(ProductResponse(products: MockProducts.mockProductList, total: 1, skip: 1, limit: 1)))
        //Then
        XCTAssertEqual(mockView.invokedProductsLoadedOutputCount, 1)
        XCTAssertTrue(mockView.invokedProductsLoadedOutput)
        XCTAssertEqual(mockView.productList,MockProducts.mockProductList)
    }
    
    func test_fetchData_initializeProductResponse_mockInteractor() {
        //After Presenter Initialization
        XCTAssertEqual(mockInteractor.productResponse.products, MockProducts.mockProductList)
    }
    
    func test_fetchData_allProducts_mockInteractor() {
        //After Presenter Initialization
        XCTAssertTrue(mockInteractor.invokedFetchProducts)
    }
    
    func test_fetchData_search_mockInteractor() {
        let sampleQueryString = "TestQuery"
        //Given
        XCTAssertFalse(mockInteractor.invokedFetchQueryResults)
        XCTAssertEqual(mockInteractor.queryResult, "")
        //When
        mockView.searchByQueryText(with: sampleQueryString)
        //Then
        XCTAssertTrue(mockInteractor.invokedFetchQueryResults)
        XCTAssertEqual(mockInteractor.queryResult, sampleQueryString)
    }
    func test_fetchData_topProducts_mockInteractor() {
        //Given
        XCTAssertFalse(mockInteractor.invokedFetchProductsOfCategory)
        XCTAssertEqual(mockInteractor.selectedCategoery, "")
        //When
        presenter.handleViewOutput(with: .categoryChanged(MockCategories.mockCategory))
        //Then
        XCTAssertTrue(mockInteractor.invokedFetchProductsOfCategory)
        XCTAssertEqual(mockInteractor.selectedCategoery, MockCategories.mockCategory)
    }
    func test_fetchData_categories_mockInteractor(){
        XCTAssertTrue(mockInteractor.invokedFetchCategories)
        XCTAssertEqual(mockInteractor.categories, MockCategories.mockCategoryList)
    }
    func test_navigateTo_productDetail_mockRouter() {
        //Given
        XCTAssertFalse(mockRouter.invokedNavigatetoProductDetail)
        XCTAssertNil(mockRouter.productToShownDetailsOf)
        //When
        presenter.handleViewOutput(with: .productClicked(MockProducts.mockProduct2))
        //Then
        XCTAssertTrue(mockRouter.invokedNavigatetoProductDetail)
        XCTAssertEqual(mockRouter.productToShownDetailsOf, MockProducts.mockProduct2)
    }


}
