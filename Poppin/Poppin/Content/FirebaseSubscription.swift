//
//  FirebaseSubscription.swift
//  Poppin
//
//  Created by Blake Swaidner on 11/30/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import Foundation
import Firebase

protocol FirebaseSubscription {
    func initializeFirebaseSubscribtion()
    func handleUpdate()
}
