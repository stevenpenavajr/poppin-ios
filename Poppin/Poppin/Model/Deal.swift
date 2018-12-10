//
//  Deals.swift
//  Poppin
//
//  Created by Blake Swaidner on 12/1/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import FirebaseFirestore
import Foundation
import ObjectMapper

class Deal: Mappable {
    
    var pub: Pub? {
        return ContentManager.shared.getPub(forId: barId)
    }
    
    var barId: String?
    var days: [Int]?
    var description: String?
    var id: String?
    var time: [Date]?
    var title: String?
    
    var isActive: Bool = false
    
    required init?(map: Map) {}

    func mapping(map: Map) {
        id <- map["id"]
        barId <- map["bar-id"]
        days <- map["day"]
        title <- map["title"]
        description <- map["deal"]
        time <- map["time"]
    }
    
}
