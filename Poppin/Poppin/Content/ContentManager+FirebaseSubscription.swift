//
//  ContentManager+FirebaseSubscription.swift
//  Poppin
//
//  Created by Blake Swaidner on 12/3/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import Firebase
import FirebaseFirestore
import ObjectMapper

extension ContentManager: FirebaseSubscription {
    
    func initializeFirebaseSubscription() {
        Firestore.firestore().collection("pubs").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.pubs.removeAll()
                self.deals.removeAll()
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    
                    guard let deal = Mapper<Deal>().map(JSON: document.data()) else { return }
                    self.deals.append(deal)
                    
                    guard let pub = Mapper<Pub>().map(JSON: document.data()) else { return }
                    self.pubs.append(pub)
                }
                self.handleUpdate()
            }
        }
    }
    
    func handleUpdate() {
        delegate?.contentManagerDidUpdate(self)
    }
    
}
