// File: MBDealCell.swift
// Purpose: <enter purpose>
// Date Created: 10/16/18
// Created By: Steven Penava

import CoreLocation
import Kingfisher
import MessageUI
import UIKit

protocol DealCellDelegate: class {
    
    func dealCell(_ dealCell: DealCell, didShareDeal: Deal)
    
}

class DealCell: UITableViewCell {

    static let identifier = "DealCell"
    
    @IBOutlet weak var barNameLabel: UILabel!
    @IBOutlet weak var barLogoImageView: UIImageView!
    @IBOutlet weak var barHeaderImageView: UIImageView!
    private let barHeaderImageGradient = CAGradientLayer()
    
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
    
    weak var delegate: DealCellDelegate?
    
    var deal: Deal?
    private var timeRemainingTimer: Timer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        styleSubviews()
        startTimer()
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        barHeaderImageGradient.frame = barHeaderImageView.layer.frame
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let height: CGFloat = 10.0 + 58.0 + 160.0 + 24.0 + dealTitleLabel.sizeThatFits(CGSize(width: size.width - 56, height: size.height)).height + dealDescriptionLabel.sizeThatFits(CGSize(width: size.width - 56, height: size.height)).height + 16.0 + 28.0 + 20.0
        return CGSize(width: size.width, height: height)
    }
    
    // MARK: - Initialization
    
    func startTimer() {
        timeRemainingTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimeRemaining), userInfo: nil, repeats: true)
        timeRemainingTimer?.fire()
    }
    
    @objc func updateTimeRemaining() {
        guard let days = deal?.days else { return }
        guard let hours = deal?.time else { return }
        let date = Date().timeUntilDate(date: hours[1])
        let timeRemaining = String(format: "%02d:%02d:%02d", date.hour ?? 0, date.minute ?? 0, date.second ?? 0)
        self.timeRemainingLabel.text = timeRemaining
    }
    
    func configureCell(withDeal deal: Deal) {
        self.deal = deal
        guard let pub = deal.pub else { return }
        barHeaderImageView.kf.setImage(with: pub.imageUrl)
        barNameLabel.text = pub.name ?? ""
        dealTitleLabel.text = deal.title
        dealDescriptionLabel.text = deal.description
        distanceFromUserLabel.text = String(pub.distFromUser ?? 0.0) + " mi"
        timeRemainingLabel.text = ""
        startTimer()
    }
    
    // MARK: - Actions
    
    @IBAction func didTapShare(_ sender: Any) {
        guard let deal = deal else { return }
        delegate?.dealCell(self, didShareDeal: deal)
    }
    
    // MARK: - Styling
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        let scale: CGFloat = highlighted ? 0.98 : 1.0
        UIView.animate(withDuration: 0.1) {
            self.dropShadowView.transform = CGAffineTransform.identity.scaledBy(x: scale, y: scale)
            self.containerView.transform = CGAffineTransform.identity.scaledBy(x: scale, y: scale)
        }
    }
    
    func styleSubviews() {
        // Container View
        containerView.layer.cornerRadius = 10.0
        containerView.clipsToBounds = true
        
        // Drop Shadow View
        dropShadowView.layer.masksToBounds = false
        dropShadowView.layer.shadowRadius = 6.0
        dropShadowView.layer.shadowOpacity = 0.25
        dropShadowView.layer.shadowColor = UIColor.black.cgColor
        dropShadowView.layer.shadowOffset = CGSize(width: 4.0 , height: 4.0)
        
        // Bar Logo ImageView
        barLogoImageView.clipsToBounds = true
        barLogoImageView.contentMode = .scaleAspectFit
        // Bar Name Label
        barNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        barNameLabel.textColor = Theme.Color.textColor
        
        // Distance From User Label
        distanceFromUserLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        distanceFromUserLabel.textColor = Theme.Color.textOffColor
        
        // Header Image
        barHeaderImageView.contentMode = .scaleAspectFill
        barHeaderImageView.backgroundColor = Theme.Color.imageBackgroundColor
        barHeaderImageView.clipsToBounds = true
        barHeaderImageGradient.colors = [Theme.Color.clear.cgColor, UIColor.black.withAlphaComponent(0.7).cgColor]
        barHeaderImageGradient.locations = [0.7, 1.0]
        barHeaderImageView.layer.addSublayer(barHeaderImageGradient)
        
        // Deal Title Label
        dealTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        dealTitleLabel.textColor = Theme.Color.textColor
        dealTitleLabel.numberOfLines = 0
        
        // Deal Description Label
        dealDescriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        dealDescriptionLabel.textColor = Theme.Color.textOffColor
        dealDescriptionLabel.numberOfLines = 0
        
        // Share Button
        shareButton.setTitle("Share Deal", for: .normal)
        shareButton.tintColor = Theme.Color.primaryBlue
        shareButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        // Time Remaining Label
        timeRemainingLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        timeRemainingLabel.textColor = Theme.Color.textOffColor
        
        // View Deal Label
        viewDealLabel.backgroundColor = Theme.Color.primaryYellow
        viewDealLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        viewDealLabel.text = "View Deal"
        viewDealLabel.textAlignment = .center
        viewDealLabel.clipsToBounds = true
        viewDealLabel.layer.cornerRadius = viewDealLabel.frame.height / 2
    }

}
