//
//  ContentManager.swift
//  Poppin
//
//  Created by Blake Swaidner on 12/3/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import Foundation

protocol ContentManagerDelegate: class {
    func contentManagerDidUpdate(_ contentManager: ContentManager)
}

class ContentManager {
    
    static let shared = ContentManager()
    
    internal var pubs = [Pub]()
    internal var deals = [Deal]()
    internal var currentDeals = [Deal]()
    
    weak var delegate: ContentManagerDelegate?
    
    func getDeals() -> [Deal] {
        return deals
    }
    
    func getPubs() -> [Pub] {
        return pubs
    }
    
    func getCurrentDeals() -> [Deal] {
        
        // TODO
        // // first: order pubs by distance
        // // probably using euclidian distance formulas
        // for pub in pubs (sorted) :
        //      today = realday
        //      time = realtime
        //      if time + 24 < pub.close
        //          today = realyesterday
        //          time = time + 24
        //      if pub.today != nil
        //          for deal in today (happy-hour/
        //          trivia/music/special/other)
        //              // if deal not over but started
        //              if time < deal[3] (end) && time >
        //              deal[2] (begin)
        //                  currentDeals.append(deal)
        //              }
        //          }
        //          // now add deals that havent started yet
        //          for deal in today
        //              if time < deal[2] (begin)
        //                  currentDeals.append(deal)
        // return currentDeals
        
        
        
        return deals
        
    }
    
}
