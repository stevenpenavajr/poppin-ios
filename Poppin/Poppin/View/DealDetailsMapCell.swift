// File: DealDetailsMapCell.swift
// Purpose: <enter purpose>
// Date Created: 12/11/18
// Created By: Steven Penava

import UIKit
import MapKit

class DealDetailsMapCell: UITableViewCell, MKMapViewDelegate {

    @IBOutlet weak var pubMapView: MKMapView!
    
    let pubRadius: CLLocationDistance = 200
    
    var annotationImage: UIImage?
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let pubImage = UIImage(named: "annotation.png") else { return }
        annotationImage = pubImage.resizeImage(size: CGSize(width: 50, height: 50))
        pubMapView.delegate = self
        pubMapView.isZoomEnabled = false
        pubMapView.isScrollEnabled = false
        pubMapView.isUserInteractionEnabled = false
        selectionStyle = .none
    }
    
    func configureCell(withPub pub: Pub) {
        guard let pubLocation = pub.location else { return }
        let coordinate = CLLocationCoordinate2D(latitude: pub.lat ?? 0, longitude: pub.long ?? 0)
        let title = pub.name ?? ""
        let pubAnnotation = PubAnnotation(coordinate: coordinate, name: title)
        let pubAnnotationView = MKPinAnnotationView(annotation: pubAnnotation, reuseIdentifier: nil)
        
        pubMapView.addAnnotation(pubAnnotationView.annotation!)
        centerMapOnLocation(location: pubLocation)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: pubRadius, longitudinalMeters: pubRadius)
        pubMapView.setRegion(coordinateRegion, animated: true)
    }
    
    // MARK: - Layout
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: size.width, height: 300)
    }
    
    // MARK: - MapView
    
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
