//
//  PubAnnotationView.swift
//  Poppin
//
//  Created by Jennifer Lee on 12/11/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import Foundation
import MapKit

/*  Pub Annotation View */
internal final class PubAnnotationView: MKAnnotationView {
    
    /* Properties */
    var annotationImage: UIImage? // Declare Annotation Image
    
    internal override var annotation: MKAnnotation? { willSet { newValue.flatMap(configure(with:)) } }
}

/* Configuration */
private extension PubAnnotationView {
    
    func configure(with annotation: MKAnnotation) {
        guard annotation is PubAnnotation else { fatalError("Unexpected annotation type: \(annotation)") }
        
        /* Set Annotation Image */
        guard let pubImage = UIImage(named: "beer.png") else { return }
        annotationImage = pubImage.resizeImage(size: CGSize(width: 50, height: 50))
      
        canShowCallout = true // Might not do anything
        
        image = annotationImage
        
        clusteringIdentifier = String(describing: PubAnnotationView.self)
    }
}


