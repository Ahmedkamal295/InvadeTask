//
//  DetailsScreenPresenter.swift
//  InvadeTask
//
//  Created by Ahmed Kamal on 02/05/2024.
//

import Foundation
import UIKit

class DetailsScreenPresenter: DetailsScreenPresenterProtocol, DetailsScreenInteractorOutputProtocol {
    
   
    //MARK: - variable
    weak var view: DetailsScreenProtocol?
    private let interactor: DetailsScreenInteractorInputProtocol
    private let router: DetailsScreenRouterProtocol
    var listingModel: ListingModel?
    
    init(view: DetailsScreenProtocol, interactor: DetailsScreenInteractorInputProtocol, router: DetailsScreenRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        listingModel =  view?.fetchModel()
    }
    
    func detailsScreenFetchedSuccessfully(listing: ListingModel) {
        self.listingModel = listing
    }
    
    func detailsScreenFetchingFailed(withError error: Error) {
        //Failure - Should show alert
    }
    
    func configure(model: ListingModel) {
        view?.handelView(name: model.name ?? "", country: model.country ?? "")
        // append model in labels
        
    }
}
