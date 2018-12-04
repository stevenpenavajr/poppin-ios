// File: PubAnnotation.swift
// Purpose: <enter purpose>
// Date Created: 12/3/18
// Created By: Steven Penava

import Foundation
import MapKit
import CoreLocation

class PubAnnotation: MKPointAnnotation {
    var name:String?
    var image: UIImage? = UIImage(named: "temp-logo.png")
}
