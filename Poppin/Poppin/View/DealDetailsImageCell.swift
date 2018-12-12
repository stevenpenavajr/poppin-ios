// File: SpecificDealCell.swift
// Purpose: <enter purpose>
// Date Created: 11/30/18
// Created By: Steven Penava

import Kingfisher
import UIKit

class DealDetailsImageCell: UITableViewCell {

    @IBOutlet weak var dealImageView: UIImageView!
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dealImageView.contentMode = .scaleToFill
        selectionStyle = .none
    }
    
    func configureCell(withDeal deal: Deal) {
        guard let imageUrl = deal.pub?.imageUrl else { return }
        dealImageView.kf.setImage(with: imageUrl)
    }
    
    // MARK: - Layout
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: size.width, height: 290.0)
    }

}
