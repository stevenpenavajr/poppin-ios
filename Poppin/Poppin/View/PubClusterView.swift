//
//  PubClusterView.swift
//  Poppin
//
//  Created by Jennifer Lee on 12/11/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import Foundation
import MapKit

/* Class to group Annotations together */
internal final class PubClusterView: MKAnnotationView {
    
    var annotationImage: UIImage? // Declare Annotation Image
    
    /* Properties */
    internal override var annotation: MKAnnotation? { willSet { newValue.flatMap(configure(with:)) } }
    
    /* Initialization */
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        displayPriority = .defaultHigh
        collisionMode = .circle
        centerOffset = CGPoint(x: 0.0, y: -10.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("\(#function) not implemented.")
    }
 
}

/* Configuration */
private extension PubClusterView {
    func configure(with annotation: MKAnnotation) {
        guard let annotation = annotation as? MKClusterAnnotation else { return }
        
        let count = annotation.memberAnnotations.count // Annotations in Cluster
        
        guard let pubImage = UIImage(named: "beer-2.png") else { return } // Image of two beers
        
        /* Have image grow as count grows */
        if (count <= 5) {
            annotationImage = pubImage.resizeImage(size: CGSize(width: 40, height: 40))
        } else if (count <= 10) {
            annotationImage = pubImage.resizeImage(size: CGSize(width: 45, height: 45))
        } else if (count <= 20) {
            annotationImage = pubImage.resizeImage(size: CGSize(width: 50, height: 50))
        } else {
            annotationImage = pubImage.resizeImage(size: CGSize(width: 55, height: 55))
        }
        
        canShowCallout = true // Might not do anything
        
        /* set image to annotation */
        image = annotationImage
    }
}

