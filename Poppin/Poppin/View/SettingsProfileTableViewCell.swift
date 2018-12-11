//
//  SettingsProfileTableViewCell.swift
//  Poppin
//
//  Created by Blake Swaidner on 12/10/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import Kingfisher
import UIKit

class SettingsProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    static let identifier = "SettingsProfileCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.clipsToBounds = true
        nameLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        nameLabel.textColor = Theme.Color.textOffColor
    }
    
    func configureCell() {
        let user = ContentManager.shared.getCurrentUser()
        print(user?.name, user?.email)
        nameLabel.text = "Hi, \(user?.name ?? "User")"
        guard   let image = user?.imageUrl,
                let imageUrl = URL(string: image) else { return }
        profileImageView.kf.setImage(with: imageUrl)
    }

}
