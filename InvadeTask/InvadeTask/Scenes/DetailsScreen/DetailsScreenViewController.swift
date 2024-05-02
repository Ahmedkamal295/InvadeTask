//
//  DetailsScreenViewController.swift
//  InvadeTask
//
//  Created by Ahmed Kamal on 02/05/2024.
//

import UIKit

class DetailsScreenViewController: UIViewController, DetailsScreenProtocol {
   
    //MARK: - out let
    @IBOutlet weak var universityNameLabel: UILabel!
    @IBOutlet weak var universityStateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var webPageButton: UIButton!
    
    //MARK: - variable
    var presenter: DetailsScreenPresenterProtocol!
    var listingModel: ListingModel!
    var web_page: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(model: listingModel)
    }
    //MARK: - fetch model
    func update(with model: ListingModel) {
        universityNameLabel.text = model.name ?? ""
        universityStateLabel.text = model.stateprovince ?? ""
        countryLabel.text = model.country ?? ""
        countryCodeLabel.text = model.alphatwocode ?? ""
        webPageButton.setTitle(model.webpages?.first ?? "", for: .normal)
        web_page = model.webpages?.first ?? ""
    }
    //MARK: - action
    @IBAction func webPageAction(_ sender: Any) {
        guard let url = URL(string: web_page) else { return }
        UIApplication.shared.open(url)
    }
}
