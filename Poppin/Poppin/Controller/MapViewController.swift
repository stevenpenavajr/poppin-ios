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

    
    /* list of Pub objects from Firebase NEED TO REORGANIZE?? */
//    var deals: [Deal] = []
    
    /* Custom annotation for bar */
    var pubAnnotation:PubAnnotation!
    var annotationImage: UIImage?
    
    /* An array to hold the annotation objects from Firebase */
    var pubAnnotations: [MKPointAnnotation] = []
    
    let regionRadius: CLLocationDistance = 2000
    
    /* Check location permissions upon view */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let pubImage = UIImage(named: "annotation.png") else { return }
        annotationImage = pubImage.resizeImage(size: CGSize(width: 50, height: 50))
        
        /* Zoom into Lexington, KY on startup */
        centerMapOnLocation(location: CLLocation(latitude: 38.0406, longitude: -84.5037))
        
        /* Setting MapViewController as the delegate of the map view */
        mapView.delegate = self
    
        /* load pub locations into array of MKPointAnnotation, add to MV */
//        createAnnotations()
        
    } // End of viewDidLoad()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (self.navigationController as? CustomNavigationBarController)?.updateNavigationTitle(to: "poppin.")
    }
    
    /* Center location on map */
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    /* Loading Firebase data */
//    func createAnnotations() {
//        print("Nothing right now.")
//        deals = ContentManager.shared.getDeals()
        
//        for deal in deals {
//            let pubAnnotation = PubAnnotation()
//            if (deal.locationGP != nil) {
//                pubAnnotation.coordinate = CLLocationCoordinate2D(latitude: deal.locationGP!.latitude, longitude: deal.locationGP!.longitude)
//                pubAnnotation.title = deal.name
//                pubAnnotation.subtitle = deal.description
//                let pubAnnotationView = MKPinAnnotationView(annotation: pubAnnotation, reuseIdentifier: nil)
//                mapView.addAnnotation(pubAnnotationView.annotation!)
//            }
//        }
//    }
    
    // MARK: - MapView delegate methods
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let reuseIdentifier = "pubAnnotationView"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }

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
