//
//  Listing.swift
//  InvadeTask
//
//  Created by Ahmed Kamal on 01/05/2024.
//

import Foundation
import RealmSwift
struct ListingModel : Codable {
    var domains : [String]?
    var stateprovince : String?
    var name : String?
    var webpages : [String]?
    var country : String?
    var alphatwocode : String?

    enum CodingKeys: String, CodingKey {

        case domains = "domains"
        case stateprovince = "state-province"
        case name = "name"
        case webpages = "web_pages"
        case country = "country"
        case alphatwocode = "alpha_two_code"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        domains = try values.decodeIfPresent([String].self, forKey: .domains)
        stateprovince = try values.decodeIfPresent(String.self, forKey: .stateprovince)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        webpages = try values.decodeIfPresent([String].self, forKey: .webpages)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        alphatwocode = try values.decodeIfPresent(String.self, forKey: .alphatwocode)
    }
}

class RealmListingModel : Object {
    @objc dynamic var domains : [String]?
    @objc dynamic var stateprovince : String?
    @objc dynamic var name : String?
    @objc dynamic var webpages : [String]?
    @objc dynamic var country : String?
    @objc dynamic var alphatwocode : String?
}
