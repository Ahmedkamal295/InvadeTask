//
//  ListingRouter.swift
//  InvadeTask
//
//  Created by Ahmed Kamal on 01/05/2024.
//

import UIKit

class UsersRouter: ListingRouterProtocol {
    
    //MARK: - variable
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListingViewController") as! ListingViewController
        let interactor = ListingInteractor()
        let router = UsersRouter()
        let presenter = ListingPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
   
    
}
