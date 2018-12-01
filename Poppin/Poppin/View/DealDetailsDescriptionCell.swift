// File: DealDetailsTitleCell.swift
// Purpose: <enter purpose>
// Date Created: 11/30/18
// Created By: Steven Penava

import UIKit

class DealDetailsDescriptionCell: UITableViewCell {
    
    static let height: CGFloat = 600.0
    
    @IBOutlet weak var dealDescriptionLabel: UITextView!
    @IBOutlet weak var barTitleLabel: UILabel!
    @IBOutlet weak var dealTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dealDescriptionLabel.isEditable = false
        dealDescriptionLabel.isScrollEnabled = false
        dealDescriptionLabel.textColor = .black
        dealDescriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        
        barTitleLabel.font = UIFont.systemFont(ofSize: 19, weight: .regular)
        barTitleLabel.textColor = UIColor(red:0.83, green:0.83, blue:0.83, alpha:1.0)
        
        dealTitleLabel.font = UIFont.systemFont(ofSize: 27, weight: .bold)
        
        
        
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let dealDescriptionLabelHeight = dealDescriptionLabel.sizeThatFits(CGSize(width: size.width - 40.0, height: size.height)).height
        let barTitleLabelHeight = barTitleLabel.sizeThatFits(CGSize(width: size.width - 40.0, height: size.height)).height
        let dealTitleLabelHeight = dealTitleLabel.sizeThatFits(CGSize(width: size.width - 40.0, height: size.height)).height
        let calculatedHeight = dealDescriptionLabelHeight + barTitleLabelHeight + dealTitleLabelHeight + 54
        return CGSize(width: size.width, height: calculatedHeight)
    }
    
}
