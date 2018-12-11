// File: SpecificDealCell.swift
// Purpose: <enter purpose>
// Date Created: 11/30/18
// Created By: Steven Penava

import UIKit

class DealDetailsImageCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(withDeal deal: Deal) {
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: size.width, height: 290.0)
    }

}
