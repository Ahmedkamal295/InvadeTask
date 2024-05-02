//
//  ListingViewController.swift
//  InvadeTask
//
//  Created by Ahmed Kamal on 01/05/2024.
//

import UIKit
import MBProgressHUD
class ListingViewController: UIViewController, ListingViewProtocol {
  
    //MARK: - out let
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - variable
    var presenter: ListingPresenterProtocol!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad()
    }
    //MARK: - setupTableView
    private func setupTableView() {
        let nib = UINib(nibName: "ListingCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ListingCell")
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - custom showIndicator loading
    func showLoadingIndicator() {
        let indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
        indicator.isUserInteractionEnabled = false
        indicator.detailsLabel.text = ""
        indicator.show(animated: true)
        self.view.isUserInteractionEnabled = false
        print("Should show loading indicator")
    }
    
    // MARK: - custom hideIndicator loading
    func hideLoadingIndicator() {
        MBProgressHUD.hide(for: self.view, animated: true)
        self.view.isUserInteractionEnabled = true
        print("Should hide loading indicator")
    }
    // MARK: - reload Data
    func reloadData() {
        tableView.reloadData()
    }
    // MARK: - listing Table View
    func listingTableView() -> UITableView {
        return self.tableView
    }

    // MARK: - navigate To Listing Details
    func navigateToListingDetails(model: ListingModel) {
        navigationController?.pushViewController(ListingRouter.detailsteModule(model: model) , animated: true)
    }
}
//MARK: - UITableViewDataSource
extension ListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListingCell", for: indexPath) as! ListingCell
        presenter.configure(cell: cell, indexPath: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToListingDetails(model: presenter.listing(for: indexPath.row))
    }
}
