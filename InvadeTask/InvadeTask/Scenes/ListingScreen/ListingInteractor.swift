//
//  ListingInteractor.swift
//  InvadeTask
//
//  Created by Ahmed Kamal on 01/05/2024.
//

import Foundation
import RealmSwift
class ListingInteractor: ListingInteractorInputProtocol {
    
    //MARK: - variable
    weak var presenter: ListingInteractorOutputProtocol?
    
    //MARK: - fetch listing
    func fetchListing() {
        let parameters: [String: String] = ["country": "United Arab Emirates"]
        NetworkLayer.instance.fetchData(method: .get, url: Constants.listingEndpoint, parameters: parameters, headers: [:]) { [weak self] (result: Result<[ListingModel]>) in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.presenter?.listingFetchedSuccessfully(listing: model)
                print("model >>\(model)")
            case .failure(let error):
                self.presenter?.listingFetchingFailed(withError: error)
                ListingRouter.alertDone(alertTitle: "Error", alertMessage: error.localizedDescription)
                print("error >>\(error.localizedDescription)")
            }
        }
    }
}
