// File: SpecificDealCell.swift
// Purpose: <enter purpose>
// Date Created: 11/30/18
// Created By: Steven Penava

import UIKit
import Kingfisher

class DealDetailsImageCell: UITableViewCell {
    @IBOutlet weak var pubImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(withDeal deal: Deal) {
        pubImageView.kf.setImage(with: deal.pub?.imageUrl)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: size.width, height: 290.0)
    }

}
