//
//  SettingsTableViewCell.swift
//  Poppin
//
//  Created by Blake Swaidner on 12/10/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import CoreLocation
import FirebaseAuth
import UIKit

class SettingsTableViewCell: UITableViewCell {

    static let identifier = "SettingsCell"
    var setting: Settings?
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(withSetting setting: Settings?) {
        guard let setting = setting else { return }
        
        textLabel?.text = setting.title
        accessoryType = .disclosureIndicator
    }
    
}
