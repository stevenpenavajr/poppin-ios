// File: PubDescriptionCell.swift
// Purpose: <enter purpose>
// Date Created: 12/9/18
// Created By: Steven Penava

import UIKit

class PubDescriptionCell: UITableViewCell {
    
    @IBOutlet weak var barTitleLabel: UILabel!
    @IBOutlet weak var barDescriptionLabel: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        barDescriptionLabel.isEditable = false
        barDescriptionLabel.isScrollEnabled = false
        barDescriptionLabel.textColor = .black
        barDescriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        barTitleLabel.font = UIFont.systemFont(ofSize: 27, weight: .bold)
        barTitleLabel.textColor = .black
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // resize based on other things in storyboard
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let barDescriptionLabelHeight = barDescriptionLabel.sizeThatFits(CGSize(width: size.width - 40.0, height: size.height)).height
        let barTitleLabelHeight = barTitleLabel.sizeThatFits(CGSize(width: size.width - 40.0, height: size.height)).height
        let calculatedHeight = barDescriptionLabelHeight + barTitleLabelHeight + 54
        return CGSize(width: size.width, height: calculatedHeight)
    }
}
