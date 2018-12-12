//
//  MapViewController.swift
//  Poppin
//
//  Created by Swaidner, Jonathan on 10/7/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate,UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {
    
    /* Map view */
    @IBOutlet weak var mapView: MKMapView!
    
    /* An array to hold array of pubs */
    var pubs: [Pub] = []
    
    /* Array of pub Annotations */
    var pubAnnotations: [PubAnnotation] = []
    
    /* Variable for the selected annotation */
    var selectedAnnotation: PubAnnotation?
    //print(mapView.selectedAnnotations)
    
    /* Variables to track users location */
    private var locationManager: CLLocationManager!
    private var currentLocation: [CLLocation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Setting MapViewController as the delegate of the map view */
        mapView.delegate = self
        mapView.showsUserLocation = true;
        
        /* Set initial location to be users current location */
        setLocation()
        
        /* Add location tracking button */
        let buttonItem = MKUserTrackingBarButtonItem(mapView: mapView)
        self.navigationItem.rightBarButtonItem = buttonItem
        
        /* Add annotations to mapView */
        createAnnotations()
        
        /* Register annotation view and cluster view */
        mapView.register(PubAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        mapView.register(PubClusterView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
        
    }
    
    /* Check location permissions upon view */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        (self.navigationController as? CustomNavigationBarController)?.updateNavigationTitle(to: "poppin.")
        
        guard let tabBar = self.tabBarController?.tabBar else { return }
    }
    
    /* Function to create Pub Annotations */
    private func createAnnotations() {
        pubs = ContentManager.shared.getPubs() // Get array of all pubs
        pubAnnotations = ContentManager.shared.getPubAnnotations(pubs: pubs) // Create array of custom annotations
        mapView.addAnnotations(pubAnnotations) // Add Annotations to Map
    }
    
    /* Sets current location to updated location */
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {

        let location = mapView.userLocation
        let regionRadius: CLLocationDistance = 2000
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        mapView.setRegion(region, animated: true)
        
        locationManager.stopUpdatingLocation()
    }
    
    // Function to set up initial location
    func setLocation() {
        // Declare location manager
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Check for Location Services
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization() // Request access
            locationManager.startUpdatingLocation() // start updating location
        }
        
    }
    
    /*
    func mapView(mapView: MKMapView, didSelectAnnotationView view: PubClusterView) {
        self.selectedAnnotation = view.annotation as? PubAnnotation
        print("Selected a Cluster")
    } */
    
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: PubAnnotationView) {
        print("Selected an Annotation")
        self.selectedAnnotation = view.annotation as? PubAnnotation
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination.
        guard let destinationNavigationController = segue.destination as? UINavigationController else { return }
        
        // Pass the selected object to the new view controller.
        let targetController = destinationNavigationController.topViewController
    }
}




