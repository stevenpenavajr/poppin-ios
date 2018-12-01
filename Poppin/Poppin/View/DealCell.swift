// File: MBDealCell.swift
// Purpose: <enter purpose>
// Date Created: 10/16/18
// Created By: Steven Penava

import UIKit

class DealCell: UITableViewCell {

    static let identifier = "DealCell"
    
    @IBOutlet weak var barNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
