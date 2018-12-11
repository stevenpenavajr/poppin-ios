// File: PubButtonsCell.swift
// Purpose: <enter purpose>
// Date Created: 12/9/18
// Created By: Steven Penava

import CoreLocation
import MapKit
import UIKit

class PubButtonsCell: UITableViewCell {
    
    /* Data needed from Pub object */
    var phoneNumber:String?
    var website:String?
    var location: CLLocation?
    var name: String?
    
    // Connecting objects from storyboard
    @IBOutlet weak var callBarButton: UIButton!
    @IBOutlet weak var barSiteButton: UIButton!
    @IBOutlet weak var mapsBarButton: UIButton!
    @IBOutlet weak var dealsBarButton: UIButton!
    
    @IBOutlet weak var buttonStackView: UIStackView!
    
    // TODO: Implement "view deals" button
    let phoneIcon = UIImage(named: "phone")?.resizeImage(size: CGSize(width: 50, height: 50))
    let siteIcon = UIImage(named: "globe")?.resizeImage(size: CGSize(width: 50, height: 50))
    let mapIcon = UIImage(named: "navigation")?.resizeImage(size: CGSize(width: 50, height: 50))
    let dealsIcon = UIImage(named: "dollar-symbol")?.resizeImage(size: CGSize(width: 50, height: 50))
    
    /* call bar phone # */
    @IBAction func callBarButtonPressed(_ sender: Any) {
        
        guard let phoneNumber = phoneNumber else { return }
        
        let phoneNumberCleansed = phoneNumber.replacingOccurrences( of:"[^0-9]", with: "", options: .regularExpression)
        
        guard let number = URL(string: "tel://" + phoneNumberCleansed) else { print("D"); return }
        
        UIApplication.shared.open(number)
    }
    
    /* go to bar website */
    @IBAction func barSiteButtonPressed(_ sender: Any) {
        
        guard let website = website else { return }
        
        // TODO: add http to DB
        if let url = URL(string: "https://" + website) {
            UIApplication.shared.open(url, options: [:])
        } else {
            print("could not open URL because of the URL itself.")
        }
    }
    
    /* open in Maps */
    @IBAction func mapsBarButtonPressed(_ sender: Any) {
        guard let location = location else { return }
        
        let latitude: CLLocationDegrees = location.coordinate.latitude
        
        let longitude: CLLocationDegrees = location.coordinate.longitude
        
        let regionDistance:CLLocationDistance = 300
        
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        
        let mapItem = MKMapItem(placemark: placemark)
        
        mapItem.name = name
        
        mapItem.openInMaps(launchOptions: options)
    }
    
    /* share bar? */
    @IBAction func shareBarButtonPressed(_ sender: Any) {
    }
    
    func configureCell(withPub pub: Pub) {
        phoneNumber = pub.phone ?? ""
        website = pub.website ?? ""
        location = pub.location ?? nil
        name = pub.name ?? ""
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonStackView.backgroundColor = .black
        
        // Give buttons images
        callBarButton.setImage(phoneIcon, for: UIControl.State.normal)
        barSiteButton.setImage(siteIcon, for: UIControl.State.normal)
        mapsBarButton.setImage(mapIcon, for: UIControl.State.normal)
        dealsBarButton.setImage(dealsIcon, for: UIControl.State.normal)
        
        // Set content mode for buttons' images
        callBarButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        barSiteButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        mapsBarButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        dealsBarButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        
        /* make cell not selectable */
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: size.width - 40, height: 50)
    }

}
