// File: PubMapCell.swift
// Purpose: <enter purpose>
// Date Created: 12/9/18
// Created By: Steven Penava


import CoreLocation
import MapKit
import UIKit

class PubMapCell: UITableViewCell, MKMapViewDelegate {
    
    let pubRadius: CLLocationDistance = 200
    
    var annotationImage: UIImage?
    
    @IBOutlet weak var pubMapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pubMapView.delegate = self
        
        /* THIS PUB ANNOTATION STUFF NEEDS TO HAPPEN ELSEWHERE... */
        guard let pubImage = UIImage(named: "annotation.png") else { return }
        
        annotationImage = pubImage.resizeImage(size: CGSize(width: 50, height: 50))
        
        /*
        let pubAnnotation = PubAnnotation()
        
        pubAnnotation.coordinate = CLLocationCoordinate2D(latitude: 38.048039, longitude: -84.4985)
        pubAnnotation.title = "Stagger Inn" /* will get from an object eventually */
        pubAnnotation.subtitle = "Country bar"
        let pubAnnotationView = MKPinAnnotationView(annotation: pubAnnotation, reuseIdentifier: nil)
        pubMapView.addAnnotation(pubAnnotationView.annotation!)
        */
      
        // Setup map
        pubMapView.isZoomEnabled = false
        pubMapView.isScrollEnabled = false
        pubMapView.isUserInteractionEnabled = false
        
        /* make cell not selectable */
        self.selectionStyle = .none
       
    }
    
    func configureCell(withPub pub: Pub) {
        let coordinate = CLLocationCoordinate2D(latitude: pub.lat ?? 0, longitude: pub.long ?? 0)
        let title = pub.name ?? ""
        let pubAnnotation = PubAnnotation(coordinate: coordinate, name: title)
        let pubAnnotationView = MKPinAnnotationView(annotation: pubAnnotation, reuseIdentifier: nil)
        pubMapView.addAnnotation(pubAnnotationView.annotation!)
        
        guard let pubLocation = pub.location else { return }
        
        centerMapOnLocation(location: pubLocation)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: size.width, height: 200)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: pubRadius, longitudinalMeters: pubRadius)
        pubMapView.setRegion(coordinateRegion, animated: true)
    }
    
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

}

