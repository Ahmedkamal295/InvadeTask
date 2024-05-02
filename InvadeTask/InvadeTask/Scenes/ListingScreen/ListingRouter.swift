//
//  ListingRouter.swift
//  InvadeTask
//
//  Created by Ahmed Kamal on 01/05/2024.
//

import UIKit

class ListingRouter: ListingRouterProtocol, DetailsScreenRouterProtocol {
    
    //MARK: - variable
    weak var viewController: UIViewController?
    
    static func listingModule() -> UIViewController {
    
        let view = currentStoryboard(.Listing).instantiateViewController(withIdentifier: "ListingViewController") as! ListingViewController
        let interactor = ListingInteractor()
        let router = ListingRouter()
        let presenter = ListingPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    static func detailsteModule(model: ListingModel) -> UIViewController {
    
        let view = currentStoryboard(.Details).instantiateViewController(withIdentifier: "DetailsScreenViewController") as! DetailsScreenViewController
        let interactor = DetailsInteractor()
        let router = ListingRouter()
        let presenter = DetailsScreenPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        view.listingModel = model
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
}
