//
//  Pub.swift
//  Poppin
//
//  Created by Blake Swaidner on 11/30/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import ObjectMapper

class Pub: Mappable {
    
    var name: String?
    var address: String?
    var open: Int?
    var close: Int?
    var description: String?
    var phone: String?
    var website: String?
    var categories: [String]?
    
    var location: GeoPoint?
    
    var monday: Day?
    var tuesday: Day?
    var wednesday: Day?
    var thursday: Day?
    var friday: Day?
    var saturday: Day?
    var sunday: Day?
    
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
        location <- map["location"]
        monday <- map["Monday"]
        tuesday <- map["Monday"]
        wednesday <- map["Monday"]
        thursday <- map["Monday"]
        friday <- map["Monday"]
        saturday <- map["Monday"]
        sunday <- map["Sunday"]
    }
    
}
