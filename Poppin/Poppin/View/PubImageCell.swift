// File: PubImageCell.swift
// Purpose: <enter purpose>
// Date Created: 12/9/18
// Created By: Steven Penava

import Foundation
import UIKit

class PubImageCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: size.width, height: 290.0)
    }
    
}
