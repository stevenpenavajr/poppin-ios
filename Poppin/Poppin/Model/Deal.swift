//
//  Deals.swift
//  Poppin
//
//  Created by Blake Swaidner on 12/1/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import Foundation
import ObjectMapper

class Deal: Mappable {
    var name: String?
    var address: String?
    var open: Int?
    var close: Int?
    var description: String?
    var phone: String?
    var website: String?
    var categories: [String]?
    
    var pub: Pub?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        name <- map["name"]
        address <- map["address"]
        open <- map["open"]
        close <- map["close"]
        description <- map["description"]
        phone <- map["phone"]
        website <- map["website"]
        categories <- map["category"]
    }
    
}
