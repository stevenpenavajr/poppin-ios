// File: PubImageCell.swift
// Purpose: <enter purpose>
// Date Created: 12/9/18
// Created By: Steven Penava

import Kingfisher
import UIKit

class PubImageCell: UITableViewCell {
    
    // MARK - Initialization
    
    @IBOutlet weak var pubImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        pubImageView.contentMode = .scaleToFill
        
    }
    
    func configureCell(withPub pub: Pub?) {
        guard let imageUrl = pub?.imageUrl else { return }
        pubImageView.kf.setImage(with: imageUrl)
    }
    
    // MARK: - Layout
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: size.width, height: 290.0)
    }
    
}
