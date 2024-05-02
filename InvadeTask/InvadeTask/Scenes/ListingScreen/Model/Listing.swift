//
//  Listing.swift
//  InvadeTask
//
//  Created by Ahmed Kamal on 01/05/2024.
//

import Foundation

struct ListingModel: Codable {
    var domains: [String]?
    var stateprovince: String?
    var name: String?
    var webpages: [String]?
    var country: String?
    var alphatwocode: String?

    enum CodingKeys: String, CodingKey {
        case domains = "domains"
        case stateprovince = "state-province"
        case name = "name"
        case webpages = "web_pages"
        case country = "country"
        case alphatwocode = "alpha_two_code"
    }
}

