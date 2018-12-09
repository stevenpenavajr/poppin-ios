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
        observePubsCollection()
        observeDealsCollection()
    }
    
    func handleUpdate() {
        delegate?.contentManagerDidUpdate(self)
    }
    
    func observePubsCollection() {
        Firestore.firestore().collection("pubs").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.pubs.removeAll()
                for document in querySnapshot!.documents {
                    guard let pub = Mapper<Pub>().map(JSON: document.data()) else { return }
                    self.pubs.append(pub)
                    self.addPub(pub: pub, id: pub.id)
                }
                self.handleUpdate()
            }
        }
    }
    
    func observeDealsCollection() {
        Firestore.firestore().collection("weekly").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.deals.removeAll()
                for document in querySnapshot!.documents {
                    guard let deal = Mapper<Deal>().map(JSON: document.data()) else { return }
                    self.deals.append(deal)
    
                }
                self.handleUpdate()
            }
        }
    }
    
}
