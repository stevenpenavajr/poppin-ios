// File: MBDealCell.swift
// Purpose: <enter purpose>
// Date Created: 10/16/18
// Created By: Steven Penava

import UIKit
import CoreLocation

class DealCell: UITableViewCell {

    static let identifier = "DealCell"
    
    @IBOutlet weak var barNameLabel: UILabel!
    @IBOutlet weak var barLogoImageView: UIImageView!
    @IBOutlet weak var barHeaderImageView: UIImageView!
    
    @IBOutlet weak var distanceFromUserLabel: UILabel!
    @IBOutlet weak var timeRemainingLabel: UILabel!
    
    @IBOutlet weak var dealTitleLabel: UILabel!
    @IBOutlet weak var dealDescriptionLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var viewDealLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dropShadowView: UIView!
    
    @IBOutlet weak var containerViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerViewTopConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        styleSubviews()
        
    }
    
    func styleSubviews() {
        barLogoImageView.layer.cornerRadius = barLogoImageView.frame.height / 2
        barLogoImageView.clipsToBounds = true
        barLogoImageView.backgroundColor = Theme.Color.imageBackgroundColor
        
        barNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        barNameLabel.textColor = Theme.Color.textColor
        
        distanceFromUserLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        distanceFromUserLabel.textColor = Theme.Color.textOffColor
        
        barHeaderImageView.contentMode = .scaleAspectFill
        barHeaderImageView.backgroundColor = Theme.Color.imageBackgroundColor
        
        containerView.layer.cornerRadius = 10.0
        containerView.clipsToBounds = true
        
        dropShadowView.layer.masksToBounds = false
        dropShadowView.layer.shadowRadius = 6.0
        dropShadowView.layer.shadowOpacity = 0.25
        dropShadowView.layer.shadowColor = UIColor.black.cgColor
        dropShadowView.layer.shadowOffset = CGSize(width: 4.0 , height: 4.0)
        
        viewDealLabel.backgroundColor = Theme.Color.primaryYellow
        viewDealLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        viewDealLabel.text = "View Deal"
        viewDealLabel.textAlignment = .center
        viewDealLabel.clipsToBounds = true
        viewDealLabel.layer.cornerRadius = viewDealLabel.frame.height / 2
        
        dealDescriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        dealDescriptionLabel.textColor = Theme.Color.textOffColor
        dealDescriptionLabel.numberOfLines = 0
        
        timeRemainingLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        timeRemainingLabel.textColor = Theme.Color.textOffColor
    }

    func configureCell(withDeal deal: Deal) {
        barNameLabel.text = deal.name
        dealDescriptionLabel.text = deal.description
        distanceFromUserLabel.text = String(deal.distFromUser!) + " mi"
        timeRemainingLabel.text = "23:42 remaining"
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let height: CGFloat = 10.0 + 58.0 + 160.0 + 24.0 + dealDescriptionLabel.sizeThatFits(CGSize(width: size.width - 56, height: size.height)).height + 16.0 + 28.0 + 20.0
        return CGSize(width: size.width, height: height)
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        let scale: CGFloat = highlighted ? 0.98 : 1.0
        UIView.animate(withDuration: 0.1) {
            self.dropShadowView.transform = CGAffineTransform.identity.scaledBy(x: scale, y: scale)
            self.containerView.transform = CGAffineTransform.identity.scaledBy(x: scale, y: scale)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
