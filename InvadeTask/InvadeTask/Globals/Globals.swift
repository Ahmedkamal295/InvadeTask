//
//  Globals.swift
//  InvadeTask
//
//  Created by Ahmed Kamal on 02/05/2024.
//

import Foundation
import UIKit
// MARK: - Storyboards
enum storyboards: String {
    case Listing
    case Details
}

func currentStoryboard(_ storyboard: storyboards) -> UIStoryboard {
    return UIStoryboard(name: storyboard.rawValue, bundle: nil)
}
let appDelegate = UIApplication.shared.delegate as! AppDelegate
