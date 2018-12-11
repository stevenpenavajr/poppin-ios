//
//  User.swift
//  Poppin
//
//  Created by Blake Swaidner on 12/4/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import CoreLocation
import Foundation

class User: NSObject, NSCoding {
    
    var name: String?
    var email: String?
    var imageUrl: String?
    var location: CLLocation?
    
    init(name: String? = nil, email: String? = nil, imageUrl: String? = nil, location: CLLocation?  = nil) {
        super.init()
        self.name = name
        self.email = email
        self.imageUrl = imageUrl
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(imageUrl, forKey: "imageUrl")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as? String
        let email = aDecoder.decodeObject(forKey: "email") as? String
        let imageUrl = aDecoder.decodeObject(forKey: "imageUrl") as? String
        self.init(name: name, email: email, imageUrl: imageUrl)
    }
    
}
