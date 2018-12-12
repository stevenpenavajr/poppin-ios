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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pubMapView.delegate = self
        
        /* THIS PUB ANNOTATION STUFF NEEDS TO HAPPEN ELSEWHERE... */
        guard let pubImage = UIImage(named: "annotation.png") else { return }
        
        annotationImage = pubImage.resizeImage(size: CGSize(width: 50, height: 50))
        
        // Setup map
        pubMapView.isZoomEnabled = false
        pubMapView.isScrollEnabled = false
        pubMapView.isUserInteractionEnabled = false
        
        /* make cell not selectable */
        self.selectionStyle = .none
    }
    
    func configureCell(withPub pub: Pub) {
        let pubAnnotation = PubAnnotation()
        
        pubAnnotation.coordinate = CLLocationCoordinate2D(latitude: pub.lat ?? 0, longitude: pub.long ?? 0)
        pubAnnotation.title = pub.name ?? ""
        let pubAnnotationView = MKPinAnnotationView(annotation: pubAnnotation, reuseIdentifier: nil)
        pubMapView.addAnnotation(pubAnnotationView.annotation!)
        
        guard let pubLocation = pub.location else { return }
        
        centerMapOnLocation(location: pubLocation)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: size.width, height: 300)
    }

}
