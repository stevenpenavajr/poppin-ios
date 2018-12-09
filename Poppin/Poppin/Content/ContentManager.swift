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
   
    internal var currentUser = User()
    internal var deals = [Deal]()
    internal var dealsMap = [String : Deal]()
    internal var pubs = [Pub]()
    internal var pubsMap = [String : Pub]()
    
    weak var delegate: ContentManagerDelegate?
    
    // MARK: - User
    
    func getCurrentUser() -> User? {
        return currentUser
    }
    
    func updateCurrentUser(name: String? = nil, email: String? = nil, imageUrl: String? = nil, location: CLLocation? = nil) {
        currentUser.name = name
        currentUser.email = email
        currentUser.imageUrl = imageUrl
        currentUser.location = location
    }
    
    // MARK: - Deals
    
    func addDeal(deal: Deal?, id: String?) {
        guard let deal = deal, let id = id else { return }
        dealsMap[id] = deal
    }
    
    func getDeal(forId id: String?) -> Deal? {
        guard let id = id else { return nil }
        return dealsMap[id]
    }
    
    func getDeals() -> [Deal] {
        return deals
    }
    
    func getCurrentDeals() -> [Deal] {
        let sortedDeals = getSortedDeals()
        let calendar = Calendar.current.component(.day, from: Date())
        return deals
    }
    
    func getSortedDeals() -> [Deal] {
        guard let userLocation = currentUser.location else { return deals }
        for deal in deals {
            guard let pub = deal.pub else { return deals }
            guard let pubLocation = pub.location else { return deals }
            var distance = userLocation.distance(from: pubLocation) * 0.000621371 // convert to miles
            distance = Double(round(10*distance)/10) // rounding to two decimal places
            pub.distFromUser = distance
        }
        return deals.sorted(by: { $0.pub?.distFromUser ?? 0.0 < $1.pub?.distFromUser ?? 0.0 })
    }
    
    // MARK: - Pubs
    
    func addPub(pub: Pub?, id: String?) {
        guard let id = id, let pub = pub else { return }
        pubsMap[id] = pub
    }
    
    func getPub(forId id: String?) -> Pub? {
        guard let id = id else { return nil }
        print("id: \(id)")
        return pubsMap[id]
    }
    
    func getPubs() -> [Pub] {
        return pubs
    }

}
