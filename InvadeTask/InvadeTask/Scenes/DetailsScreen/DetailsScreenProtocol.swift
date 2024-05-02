//
//  DetailsScreenProtocol.swift
//  InvadeTask
//
//  Created by Ahmed Kamal on 02/05/2024.
//

import Foundation
import UIKit
protocol DetailsScreenProtocol: AnyObject {
    var presenter: DetailsScreenPresenterProtocol! { get set }
    func update(with model: ListingModel)
}

protocol DetailsScreenPresenterProtocol: AnyObject {
    var view: DetailsScreenProtocol? { get set }
    func viewDidLoad(model: ListingModel)
}
protocol DetailsScreenRouterProtocol {
}

protocol DetailsScreenInteractorInputProtocol {
    var presenter: DetailsScreenInteractorOutputProtocol? { get set }
    func fetchListing()
}

protocol DetailsScreenInteractorOutputProtocol: AnyObject {
//    func detailsScreenFetchedSuccessfully(listing: ListingModel)
//    func detailsScreenFetchingFailed(withError error: Error)
}

