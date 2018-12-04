//
//  DealsTableViewController+ContentManagerDelegate.swift
//  Poppin
//
//  Created by Blake Swaidner on 12/3/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import Foundation

extension DealsTableViewController: ContentManagerDelegate {
    
    func contentManagerDidUpdate(_ contentManager: ContentManager) {
        reloadData()
    }
    
}
