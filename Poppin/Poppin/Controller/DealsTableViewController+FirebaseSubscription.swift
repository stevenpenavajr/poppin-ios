//
//  DealsTableViewController+FirebaseSubscription.swift
//  Poppin
//
//  Created by Blake Swaidner on 11/30/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import ObjectMapper

extension DealsTableViewController: FirebaseSubscription {
    
    func initializeFirebaseSubscription() {
        Firestore.firestore().collection("pubs").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    guard let deal = Mapper<Deal>().map(JSON: document.data()) else { return }
                    self.deals.append(deal)
                }
                self.handleUpdate()
            }
        }
    }
    
    func handleUpdate() {
        tableView.reloadData()
    }
    
}
