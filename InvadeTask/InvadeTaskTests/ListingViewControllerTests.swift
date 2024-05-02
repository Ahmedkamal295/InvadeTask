//
//  ListingViewControllerTests.swift
//  InvadeTaskTests
//
//  Created by Ahmed Kamal on 02/05/2024.
//


import XCTest
@testable import InvadeTask

class ListingViewControllerTests: XCTestCase {
    
    // MARK: - variable
    var viewController: ListingViewController!
    var mockPresenter: MockListingPresenter!
    
    // MARK: - setUp With Error
    override func setUpWithError() throws {
        super.setUp()
        // Create an instance of the view controller
        viewController = ListingViewController()
        mockPresenter = MockListingPresenter()
        // Assign the mock presenter to the view controller
        viewController.presenter = mockPresenter
        // Load the view
        viewController.loadViewIfNeeded()
    }
    // MARK: - tear Down With Error
    override func tearDownWithError() throws {
        viewController = nil
        mockPresenter = nil
        super.tearDown()
    }
    // MARK: - test ViewDidLoad
    func testViewDidLoad() {
        viewController.viewDidLoad()
    }
    // MARK: - test ViewWillAppear
    func testViewWillAppear() {
        viewController.viewWillAppear(false)
    }
    // MARK: - test NavigateToListingDetails
    func testNavigateToListingDetails() {
        // Mock data for ListingModel
        let mockModel = ListingModel(domains: ["google.com"], stateprovince: "State", name: "Listing Name", webpages: ["https://mbzuai.ac.ae/"], country: "United Arab Emirates", alphatwocode: "AE")
        
        // Call navigateToListingDetails
        viewController.navigateToListingDetails(model: mockModel)
    }
}
// MARK: -  Mock ListingPresenter
class MockListingPresenter: ListingPresenterProtocol {
    
    var view: InvadeTask.ListingViewProtocol?
    var numberOfRows: Int = 0
    var listingModels: [ListingModel] = []
    
    func viewDidLoad() {
      }
    func configure(cell: InvadeTask.ListingCellView, indexPath: IndexPath) {
      }
    func listing(for row: Int) -> InvadeTask.ListingModel {
        return listingModels[row]
    }
}
