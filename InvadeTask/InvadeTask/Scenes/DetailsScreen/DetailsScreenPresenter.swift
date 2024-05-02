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
    
    func viewDidLoad(model: ListingModel) {
        listingModel =  model
        view?.update(with: model)
    }
}
