// File: DealDetailsTitleCell.swift
// Purpose: <enter purpose>
// Date Created: 11/30/18
// Created By: Steven Penava

import UIKit

class DealDetailsTitleCell: UITableViewCell {
    static let height: CGFloat = 100.0
    
    @IBOutlet weak var barTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        barTitleLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
