//
//  ContentManager.swift
//  Poppin
//
//  Created by Blake Swaidner on 12/3/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol ContentManagerDelegate: class {
    func contentManagerDidUpdate(_ contentManager: ContentManager)
}

class ContentManager {
    
    static let shared = ContentManager()
    
    internal var pubs = [Pub]()
    internal var deals = [Deal]()
    
    var currentUser: User? {
        return nil
        return Auth.auth().currentUser 
    }
    
    weak var delegate: ContentManagerDelegate?
    
    func getDeals() -> [Deal] {
        return deals
    }
    
    func getPubs() -> [Pub] {
        return pubs
    }
    
    func getCurrentDeals() -> [Deal] {
        
        // TODO
        return deals
        
    }
    
}
