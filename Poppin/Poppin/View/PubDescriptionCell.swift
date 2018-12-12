// File: PubDescriptionCell.swift
// Purpose: <enter purpose>
// Date Created: 12/9/18
// Created By: Steven Penava

import UIKit

class PubDescriptionCell: UITableViewCell {
    
    /* data from pub */
    var pubDescription: String?
    var pubName: String?
    
    @IBOutlet weak var barTitleLabel: UILabel!
    @IBOutlet weak var barDescriptionLabel: UITextView!
    @IBOutlet weak var barDescriptionHeadingLabel: UILabel!
    
    // MARK - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /* "Pub description" label */
        barDescriptionHeadingLabel.textColor = .black
        barDescriptionHeadingLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        barDescriptionHeadingLabel.text = "Pub Information"
        
        /* text view of bar info */
        barDescriptionLabel.isEditable = false
        barDescriptionLabel.isScrollEnabled = false
        barDescriptionLabel.textColor = .black
        barDescriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        /* name of bar, big heading */
        barTitleLabel.font = UIFont.systemFont(ofSize: 27, weight: .bold)
        barTitleLabel.textColor = .black
        
        /* fixing margin / padding stuff */
        barDescriptionLabel.textContainer.lineFragmentPadding = 0
        barDescriptionLabel.textContainerInset = .zero
        
        /* make cell not selectable */
        self.selectionStyle = .none
    }
    
    func configureCell(withPub pub: Pub) {
        pubDescription = pub.description ?? ""
        pubName = pub.name ?? ""
        
        /* filling in content */
        barDescriptionLabel.text = pubDescription
        barTitleLabel.text = pubName
    }
    
    // MARK: - Layout
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let barDescriptionLabelHeight = barDescriptionLabel.sizeThatFits(CGSize(width: size.width - 40.0, height: size.height)).height
        let barTitleLabelHeight = barTitleLabel.sizeThatFits(CGSize(width: size.width - 40.0, height: size.height)).height
        let barDescriptionHeadingHeight = barDescriptionHeadingLabel.sizeThatFits(CGSize(width: size.width - 40.0, height: size.height)).height
        
        let calculatedHeight = barDescriptionLabelHeight + barTitleLabelHeight + barDescriptionHeadingHeight + 80
        return CGSize(width: size.width, height: calculatedHeight)
    }
}
