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
    
    //MARK: - Check Connection
    static func checkConnection() {
        if Reachability.isConnectedToNetwork() {
            // Proceed with the action if connected to the network
        } else {
            // Show alert if there's no network connection
            alertDone(alertTitle: "Error", alertMessage: "Please check your internet connection")
        }
    }
    
    //MARK: - Alert Handling
    static func alertDone(alertTitle: String, alertMessage: String) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let okAlertButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAlertButton)
        
        // Access the root view controller to present the alert
        if let rootViewController = UIApplication.shared.keyWindow?.rootViewController {
            rootViewController.present(alert, animated: true, completion: nil)
        }
    }
   
    static func detailsteModule(model: ListingModel) -> UIViewController {
    
        let view = currentStoryboard(.Details).instantiateViewController(withIdentifier: "DetailsScreenViewController") as! DetailsScreenViewController
        let interactor = DetailsInteractor()
        let router = ListingRouter() // Note: This might need to be DetailsScreenRouter
        let presenter = DetailsScreenPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        view.listingModel = model
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
}
