//
//  Pub.swift
//  Poppin
//
//  Created by Blake Swaidner on 11/30/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import CoreLocation
import Foundation
import Firebase
import FirebaseFirestore
import ObjectMapper

class Pub: Mappable {
    
    var hours: [String: [Date]]?
    
    var id: String?
    var address: String?
    var categories: [String]?
    var name: String?
    var open: Int?
    var close: Int?
    var description: String?
    var phone: String?
    var website: String?
    
    var imageString: String?
    var imageUrl: URL? {
        guard let image = imageString else { return nil }
        return URL(string: image)
    }
    
    var distFromUser: CLLocationDistance?
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
        id <- map["id"]
        name <- map["name"]
        address <- map["address"]
        open <- map["open"]
        close <- map["close"]
        description <- map["description"]
        phone <- map["phone"]
        website <- map["site"]
        categories <- map["category"]
        locationGP <- map["location"]
        imageString <- map["imageUrl"]
        hours <- map["hours"]
    }
    
}
