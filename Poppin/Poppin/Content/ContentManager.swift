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
    
    // ADDED
    func allPubs(completion: ([PubAnnotation], Error?) -> ())
    // END ADDED
}

class ContentManager: NSObject {
    
    static let shared = ContentManager()
   
    internal var currentUser: User? {
        didSet {
            do {
                let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: currentUser, requiringSecureCoding: true)
                UserDefaults.standard.set(encodedData, forKey: "currentUser")
                UserDefaults.standard.synchronize()
            } catch {
                return
            }
        }
    }
    
    internal var deals = [Deal]()

    internal var dealsMap = [String : Deal]()
    internal var pubs = [Pub]()
    internal var pubsMap = [String : Pub]()

    internal var currentDeals = [Deal]()

    
    let locationManager = CLLocationManager()
    
    weak var delegate: ContentManagerDelegate?
    
    // MARK: - User
    
    func getCurrentUser() -> User? {
        guard let decodedData  = UserDefaults.standard.object(forKey: "currentUser") as? Data else { return nil }
        do {
            let decodedUser = try NSKeyedUnarchiver.unarchivedObject(ofClasses: [User.self], from: decodedData) as? User
            return decodedUser
        } catch {
            return nil
        }
    }
    
    func updateCurrentUser(name: String? = nil, email: String? = nil, imageUrl: String? = nil, location: CLLocation? = nil) {
        let user = User()
        user.name = name
        user.email = email
        user.imageUrl = imageUrl
        user.location = location
        currentUser = user
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
        var currentDeals: [Deal] = []
        let sortedDeals = getSortedDeals()
        
        let day = Calendar.current.component(.weekday, from: Date())

        print("Getting current deals...")
        for deal in sortedDeals {
            guard let days = deal.days else { break }
            guard let hours = deal.time else { break }
            
            if days.contains(day), Date().isBetweenDates(startDate: hours[0], endDate: hours[1]) {               
                currentDeals.append(deal)
            }
        }
        
        return currentDeals
    }
    

    func getSortedDeals() -> [Deal] {
        guard let userLocation = currentUser?.location else { print("NIL"); return deals }
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
        return pubsMap[id]

    }
    
    func getPubs() -> [Pub] {
        return pubs
    }
    
    func getPubAnnotations(pubs: [Pub]) -> [PubAnnotation] {
        
        var pubPins: [PubAnnotation] = []
        
        for pub in pubs {
            /* Create Annotations */
            if pub.locationGP != nil {
                let coordinate = CLLocationCoordinate2D(latitude: pub.locationGP!.latitude, longitude: pub.locationGP!.longitude)
                let title: String? = pub.name
            
                let pubAnnotation = PubAnnotation(coordinate: coordinate, name: title)
            
                pubPins.append(pubAnnotation)
            }
        }
        return pubPins
    }

}
