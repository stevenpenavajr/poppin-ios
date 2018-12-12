//
//  DealDetailsTableViewController+UberRides.swift
//  Poppin
//
//  Created by Blake Swaidner on 12/12/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import CoreLocation
import UberRides
import UIKit

extension DealDetailsTableViewController {
    
    func setupUberButton() {
        guard let deal = deal else { return }
        
        let builder = RideParametersBuilder()
        let pickupLocation = CLLocation(latitude: 38.0381, longitude: -84.5038)
        let dropoffLocation = deal.pub?.location
        
        builder.pickupLocation = pickupLocation
        builder.dropoffLocation = dropoffLocation
        builder.dropoffNickname = "Tin Roof"
        builder.dropoffAddress = "303 S. Limestone"
        let rideParameters = builder.build()
        
        uberRidesButton = RideRequestButton(rideParameters: rideParameters)
        
        view.addSubview(uberRidesButton ?? RideRequestButton())
        layoutUberButton()
    }
    
    func layoutUberButton() {
        var layoutGuide = view.layoutMarginsGuide
        if #available(iOS 11, *) { layoutGuide = view.safeAreaLayoutGuide }

        guard let uberRidesButton = uberRidesButton else { return }
        uberRidesButton.translatesAutoresizingMaskIntoConstraints = false
        uberRidesButton.backgroundColor = UIColor.black
        uberRidesButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        uberRidesButton.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 20).isActive = true
        uberRidesButton.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -20).isActive = true
        uberRidesButton.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: 40).isActive = true
    }
    
    
    
    
}
