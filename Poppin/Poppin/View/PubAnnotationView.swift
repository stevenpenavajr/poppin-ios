//
//  PubAnnotationView.swift
//  Poppin
//
//  Created by Jennifer Lee on 12/11/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//
/*
import Foundation
import MapKit

//  MARK: Battle Rapper View
internal final class PubAnnotationView: MKMarkerAnnotationView {
    //  MARK: Properties
  
    var annotationImage: UIImage? // Declare Annotation Image
    
    internal override var annotation: MKAnnotation? { willSet { newValue.flatMap(configure(with:)) } }
}
//  MARK: Configuration
private extension PubAnnotationView {
    
    //guard let pubImage = UIImage(named: "annotation.png") //else { return }
    //var annotationImage: UIImage? = pubImage.resizeImage(size: CGSize(width: 50, height: 50))
    
    func configure(with annotation: MKAnnotation) {
        guard annotation is Pub else { fatalError("Unexpected annotation type: \(annotation)") }
        //    CONFIGURE
        
        // Set Annotation Image
        guard let pubImage = UIImage(named: "annotation.png") else { return }
        annotationImage = pubImage.resizeImage(size: CGSize(width: 50, height: 50))
        image = annotationImage
        
        clusteringIdentifier = String(describing: PubAnnotationView.self) // Set Clustering
    }
}

*/
