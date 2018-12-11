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
    
    let mapIconPoppin = UIImage(named: "map-poppin")!.resizeImage(size: CGSize(width: 30, height: 30))
    
    /* Custom annotation for bar */
    var pubAnnotation:PubAnnotation!

    var annotationImage: UIImage?
    
    /* An array to hold the annotation objects from Firebase */
    var pubAnnotations: [MKPointAnnotation] = []
    
    //let regionRadius: CLLocationDistance = 2000
    
    /* Check location permissions upon view */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // Variables to track users location
    private var locationManager: CLLocationManager!
    private var currentLocation: [CLLocation] = []
    //var updatedLocationsArray = AnyObject
    //var userLocation: MKUserLocation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let pubImage = UIImage(named: "annotation.png") else { return }
        annotationImage = pubImage.resizeImage(size: CGSize(width: 50, height: 50))
        
        /* Setting MapViewController as the delegate of the map view */
        mapView.delegate = self
        mapView.showsUserLocation = true;
    
        setLocation() // Set initial location to be users current location
        
        // Add location tracking button
        let buttonItem = MKUserTrackingBarButtonItem(mapView: mapView)
        self.navigationItem.rightBarButtonItem = buttonItem
        
        /* load pub locations into array of MKPointAnnotation, add to MV */
        //createAnnotations()
    
    } // End of viewDidLoad()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (self.navigationController as? CustomNavigationBarController)?.updateNavigationTitle(to: "poppin.")
    }
    
    /*
    /* Loading Firebase data */
    func createAnnotations() {
        print("Nothing right now.")
        deal = ContentManager.shared.getDeals()
        
        for deal in deal {
            let pubAnnotation = PubAnnotation()
            if (deal.locationGP != nil) {
                pubAnnotation.coordinate = CLLocationCoordinate2D(latitude: deal.locationGP!.latitude, longitude: deal.locationGP!.longitude)
                pubAnnotation.title = deal.name
                pubAnnotation.subtitle = deal.description
                let pubAnnotationView = MKPinAnnotationView(annotation: pubAnnotation, reuseIdentifier: nil)
                mapView.addAnnotation(pubAnnotationView.annotation!)
            }
        }
    } */
    
    // Sets current location to updated location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        
        let location = mapView.userLocation
        let regionRadius: CLLocationDistance = 2000
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        mapView.setRegion(region, animated: true)
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
 */
    
    // MARK: - MapView delegate methods
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseIdentifier = "pubAnnotationView"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)

        //if (annotationView == mapView.userLocation) {
        //    return nil
        //}
        //else 
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }

        //annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
        //annotationView?.canShowCallout = true
        //annotationView?.image = annotationImage
        
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

