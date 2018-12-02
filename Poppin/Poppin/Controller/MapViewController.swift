//
//  MapViewController.swift
//  Poppin
//
//  Created by Swaidner, Jonathan on 10/7/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate,UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {

    let pin = UIImage(named: "temp-logo.png")
    
    @IBOutlet weak var mapView: MKMapView!
    
    /* An array to hold the annotation objects from the JSON file */
    var pubs: [MKPointAnnotation] = []
    
    /* Keep track of authorization status for accessing the user’s location */
    let locationManager = CLLocationManager()
    
    /* Check location permissions upon view */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Map"
        
        // Set inital location to be Lexington, KY
        let initialLocation = CLLocation(latitude: 38.0406, longitude: -84.5037)
        /* Zoom into initialLocation on startup */
        centerMapOnLocation(location: initialLocation)
        
        /* Setting ViewController as the delegate of the map view */
        mapView.delegate = self
        
        // load annotations
        loadInitialData()
        
        createAnnotations()
        
    } // End of viewDidLoad()
    
    
    /*
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        print("Updating location")

        
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Error \(error)")
    }
    
    // Function to track current location of users
    func determineCurrentLocation()
    {
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            //locationManager.startUpdatingHeading()
            locationManager.startUpdatingLocation()
        }
    }
    */
    
    /* “Tick” the map view’s Shows-User-Location checkbox if your app is authorized */
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else { // tell locationManager to request authorization from the user
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    // Helper Function to center location on map
    let regionRadius: CLLocationDistance = 2000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    /* Loading JSON data */
    func loadInitialData() {
        // Function to load JSON
        // But for now it just makes tin roof
        
        // Sample Annotation
        let tinroof = MKPointAnnotation()
        tinroof.title = "Tin Roof"
        tinroof.coordinate = CLLocationCoordinate2D(latitude:38.043302, longitude: -84.501813)
        
        pubs.append(tinroof)
    }

    func createAnnotations() {
        
        for pub in pubs {
            /* Add pubs to map */
            let view = MKAnnotationView(annotation: pub, reuseIdentifier: nil)

            view.image = pin
            view.isEnabled = true
            view.canShowCallout = true
            
            mapView.addAnnotations(pubs)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        guard let destinationNavigationController = segue.destination as? UINavigationController else { return }
        // Pass the selected object to the new view controller.
        let targetController = destinationNavigationController.topViewController
    }
 
    
    
}
