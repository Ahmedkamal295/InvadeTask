//
//  AppDelegate.swift
//  InvadeTask
//
//  Created by Ahmed Kamal on 01/05/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    //MARK: - window
    var window: UIWindow?
    
    //MARK: - didFinish
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.rootViewController = UINavigationController(rootViewController: ListingRouter.listingModule())
        return true
    }

}

