//
//  ContentManager.swift
//  Poppin
//
//  Created by Blake Swaidner on 12/3/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import CoreLocation
import Foundation
import FirebaseAuth

protocol ContentManagerDelegate: class {
    func contentManagerDidUpdate(_ contentManager: ContentManager)
}

class ContentManager {
    
    static let shared = ContentManager()
    
    internal var pubs = [Pub]()
    internal var deals = [Deal]()
    internal var currentUser = User()
    
    weak var delegate: ContentManagerDelegate?
    
    // Pubs & Deals
    
    func getDeals() -> [Deal] {
        return deals
    }
    
    func getSortedDeals() -> [Deal] {
        guard let userLocation = currentUser.location else { return deals }
        for deal in deals {
            guard let dealLocation = deal.location else { return deals }
            var distance = userLocation.distance(from: dealLocation) * 0.000621371 // convert to miles
            distance = Double(round(10*distance)/10) // rounding to two decimal places
            deal.distFromUser = distance
        }
        print("BLAKE")
        return deals.sorted(by: { $0.distFromUser ?? 0.0 < $1.distFromUser ?? 0.0 })
    }
    
    func getPubs() -> [Pub] {
        return pubs
    }
    
    func getCurrentDeals() -> [Deal] {
        // TODO
        return deals
    }
    
    // User
    
    func getCurrentUser() -> User? {
        return currentUser
    }
    
    func updateCurrentUser(name: String? = nil, email: String? = nil, imageUrl: String? = nil, location: CLLocation? = nil) {
        currentUser.name = name
        currentUser.email = email
        currentUser.imageUrl = imageUrl
        currentUser.location = location
    }

}
