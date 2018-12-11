// File: PubButtonsCell.swift
// Purpose: <enter purpose>
// Date Created: 12/9/18
// Created By: Steven Penava

import UIKit

class PubButtonsCell: UITableViewCell {
    
    // Connecting objects from storyboard
    @IBOutlet weak var callBarButton: UIButton!
    @IBOutlet weak var barSiteButton: UIButton!
    @IBOutlet weak var mapsBarButton: UIButton!
    @IBOutlet weak var shareBarButton: UIButton!
    
    @IBOutlet weak var buttonStackView: UIStackView!
    
    // images for buttons
    let phoneIcon = UIImage(named: "phone")?.resizeImage(size: CGSize(width: 50, height: 50))
    let siteIcon = UIImage(named: "globe")?.resizeImage(size: CGSize(width: 50, height: 50))
    let mapIcon = UIImage(named: "navigation")?.resizeImage(size: CGSize(width: 50, height: 50))
    let shareIcon = UIImage(named: "share")?.resizeImage(size: CGSize(width: 50, height: 50))
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonStackView.backgroundColor = .black
        
        // Give buttons images
        callBarButton.setImage(phoneIcon, for: UIControl.State.normal)
        barSiteButton.setImage(siteIcon, for: UIControl.State.normal)
        mapsBarButton.setImage(mapIcon, for: UIControl.State.normal)
        shareBarButton.setImage(shareIcon, for: UIControl.State.normal)
        
        // Set content mode for buttons' images
        callBarButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        barSiteButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        mapsBarButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        shareBarButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: size.width - 40, height: 50)
    }

}
