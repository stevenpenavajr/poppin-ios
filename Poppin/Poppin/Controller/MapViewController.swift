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

    let pin = UIImage(named: "Images/temp-logo.png")
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Map"
        
        // Set initial location to Lexington, Kentucky
        let initialLocation = CLLocation(latitude: 38.0406, longitude: -84.5037)
        centerMapOnLocation(location: initialLocation)
        
        // Sample Annotation
        let tinroof = MKPointAnnotation()
        tinroof.title = "Tin Roof: A Life Music Joint"
        tinroof.coordinate = CLLocationCoordinate2D(latitude:38.043302, longitude: -84.501813)
        //tinroof.image = pinImage
        
        mapView.addAnnotation(tinroof)
        
        
        
    } // End of viewDidLoad()

    
    // Helper Function to center location on map
    let regionRadius: CLLocationDistance = 2000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
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
