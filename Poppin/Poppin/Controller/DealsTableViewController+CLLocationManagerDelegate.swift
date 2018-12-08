//
//  DealsTableViewController+CLLocationManagerDelegate.swift
//  Poppin
//
//  Created by Blake Swaidner on 12/7/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import CoreLocation
import UIKit

extension DealsTableViewController: CLLocationManagerDelegate {
    
    func requestUserLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        ContentManager.shared.updateCurrentUser(location: locations.last)
    }
}
