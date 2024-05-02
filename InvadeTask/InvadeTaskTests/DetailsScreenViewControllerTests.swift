//
//  DetailsScreenViewControllerTests.swift
//  InvadeTaskTests
//
//  Created by Ahmed Kamal on 02/05/2024.
//

import XCTest

@testable import InvadeTask

class DetailsScreenViewControllerTests: XCTestCase {
    
    // MARK: - variable
    var viewController: DetailsScreenViewController!
    var mockPresenter: MockDetailsScreenPresenter!
    var mockListingModel: ListingModel!
    
    // MARK: - setUp With Error
    override func setUpWithError() throws {
        super.setUp()
        // Create an instance of the view controller
        viewController = DetailsScreenViewController()
        // Create a mock presenter
        mockPresenter = MockDetailsScreenPresenter()
        // Assign the mock presenter to the view controller
        viewController.presenter = mockPresenter
        // Create a mock listing model
        mockListingModel = ListingModel(/* Initialize with mock data */)
        viewController.listingModel = mockListingModel
        // Load the view
        viewController.loadViewIfNeeded()
    }
    // MARK: - tear DownWithError
    override func tearDownWithError() throws {
        viewController = nil
        mockPresenter = nil
        mockListingModel = nil
        super.tearDown()
    }
    // MARK: - test ViewDidLoad
    func testViewDidLoad() {
        viewController.viewDidLoad()
    }
    // MARK: - test Update With Model
    func testUpdateWithModel() {
        viewController.update(with: mockListingModel)
    }
    // MARK: - test Web Page Action
    func testWebPageAction() {
    }
}
// MARK: - MockDetailsScreenPresenter to mock the presenter
class MockDetailsScreenPresenter: DetailsScreenPresenterProtocol {
    
    var view: InvadeTask.DetailsScreenProtocol?
    
    func viewDidLoad(model: ListingModel) {

    }
}
