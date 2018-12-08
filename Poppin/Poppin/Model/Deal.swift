//
//  Deals.swift
//  Poppin
//
//  Created by Blake Swaidner on 12/1/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import Foundation
import ObjectMapper
import FirebaseFirestore
import CoreLocation

class Deal: Mappable {
    var name: String?
    var address: String?
    var open: Int?
    var close: Int?
    var description: String?
    var phone: String?
    var website: String?
    var categories: [String]?
    
    var distFromUser: CLLocationDistance?
    
    var pub: Pub?
    
    // Location
    
    var lat: CLLocationDegrees?
    var long: CLLocationDegrees?
    
    var locationGP: GeoPoint? {
        didSet {
            lat = locationGP?.latitude
            long = locationGP?.longitude
        }
    }
    
    var location: CLLocation? {
        return CLLocation(latitude: lat ?? 0, longitude: long ?? 0)
    }
    
    
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
        locationGP <- map["location"]
    }
    
}
