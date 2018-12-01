//
//  DealsTableViewController+FirebaseSubscription.swift
//  Poppin
//
//  Created by Blake Swaidner on 11/30/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import Foundation

extension DealsTableViewController: FirebaseSubscription {
    
    func initialize() {
        
    }
    
    func handleUpdate() {
        tableView.reloadData()
    }
    
    
    
}
