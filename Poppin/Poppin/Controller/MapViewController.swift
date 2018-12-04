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
    
    /* Map view */
    @IBOutlet weak var mapView: MKMapView!
    
    /* Custom annotation image for bar */
    var annotationImage: UIImage?
    
    /* An array to hold the annotation objects from Firebase */
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
        
        guard let pubImage = UIImage(named: "annotation.png") else { return }
        annotationImage = pubImage.resizeImage(size: CGSize(width: 50, height: 50))
        
        /* Zoom into Lexington, KY on startup */
        centerMapOnLocation(location: CLLocation(latitude: 38.0406, longitude: -84.5037))
        
        /* Setting MapViewController as the delegate of the map view */
        mapView.delegate = self
        
        /* Setting MapViewController as the delegate of the location manager */
        locationManager.delegate = self
        
        /* load pub locations into array of MKPointAnnotation, add to MV */
        createAnnotations()
        
    } // End of viewDidLoad()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (self.navigationController as? CustomNavigationBarController)?.updateNavigationTitle(to: "poppin.")
    }
    
    /* “Tick” the map view’s Shows-User-Location checkbox if your app is authorized */
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else { // tell locationManager to request authorization from the user
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    /* Center location on map */
    let regionRadius: CLLocationDistance = 2000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    /* Loading Firebase data */
    func createAnnotations() {
        
        /* SHOULD LOAD FROM FIREBASE HERE */
        // for bar in firebase db....
        // set coords, title, subtitles, etc...
        // add to 'pubs' array... or just add it to MV right here.
        
        /* For now, just a couple of bars... */
        let pubAnnotation = PubAnnotation()
        pubAnnotation.coordinate = CLLocationCoordinate2D(latitude:38.043302, longitude: -84.501813)
        pubAnnotation.title = "The Tin Roof"
        pubAnnotation.subtitle = "A Live Music Joint"
        let pubAnnotationView = MKPinAnnotationView(annotation: pubAnnotation, reuseIdentifier: nil)
        mapView.addAnnotation(pubAnnotationView.annotation!)
        
        let pubAnnotation2 = PubAnnotation()
        pubAnnotation2.coordinate = CLLocationCoordinate2D(latitude:38.0428, longitude: -84.5022)
        pubAnnotation2.title = "Two Keys"
        pubAnnotation2.subtitle = "Tavern"
        let pubAnnotationView2 = MKPinAnnotationView(annotation: pubAnnotation2, reuseIdentifier: nil)
        mapView.addAnnotation(pubAnnotationView2.annotation!)
        
        let pubAnnotation3 = PubAnnotation()
        pubAnnotation3.coordinate = CLLocationCoordinate2D(latitude:38.0418, longitude: -84.5037)
        pubAnnotation3.title = "Pazzo's"
        pubAnnotation3.subtitle = "Pizza Pub"
        let pubAnnotationView3 = MKPinAnnotationView(annotation: pubAnnotation3, reuseIdentifier: nil)
        mapView.addAnnotation(pubAnnotationView3.annotation!)
        
        let pubAnnotation4 = PubAnnotation()
        pubAnnotation4.coordinate = CLLocationCoordinate2D(latitude:38.0432, longitude: -84.5025)
        pubAnnotation4.title = "The Paddock"
        pubAnnotation4.subtitle = "Bar & Patio"
        let pubAnnotationView4 = MKPinAnnotationView(annotation: pubAnnotation4, reuseIdentifier: nil)
        mapView.addAnnotation(pubAnnotationView4.annotation!)
        
    }
    
    // MARK: - MapView delegate methods
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseIdentifier = "pubAnnotationView"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
        annotationView?.canShowCallout = true
        annotationView?.image = annotationImage
        
        return annotationView
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination.
        guard let destinationNavigationController = segue.destination as? UINavigationController else { return }
        
        // Pass the selected object to the new view controller.
        let targetController = destinationNavigationController.topViewController
    }
}
