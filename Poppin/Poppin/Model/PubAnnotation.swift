// File: PubAnnotation.swift
// Purpose: <enter purpose>
// Date Created: 12/3/18
// Created By: Steven Penava

import CoreLocation
import Foundation
import MapKit


 public final class PubAnnotation: NSObject, MKAnnotation {

    //  Name of the Bar
    public let name: String?

    ///    The current location of the rapper.
    public let coordinate: CLLocationCoordinate2D
 
    //  MARK: Initialization
    public init(coordinate: CLLocationCoordinate2D, name: String?) {
        self.name = name
        self.coordinate = coordinate
    }
    public required override init() {
        self.name = ""
        self.coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    }
    
    public var title: String? { return name }
 
 }
