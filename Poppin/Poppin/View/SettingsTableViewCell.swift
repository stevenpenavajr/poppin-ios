//
//  SettingsTableViewCell.swift
//  Poppin
//
//  Created by Blake Swaidner on 12/10/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import CoreLocation
import UIKit

class SettingsTableViewCell: UITableViewCell {

    static let identifier = "SettingsCell"
    
    var setting: Settings?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(withSetting setting: Settings?) {
        guard let setting = setting else { return }
        switch setting {
        case .pubs:
            let switchView = UISwitch(frame: .zero)
            let authorizationStatus = CLLocationManager.authorizationStatus() == .authorizedAlways || CLLocationManager.authorizationStatus() == .authorizedWhenInUse
            textLabel?.text = "Location Services"
            selectionStyle = .none
            switchView.isUserInteractionEnabled = false
            switchView.setOn(authorizationStatus, animated: true)
            accessoryView = switchView
        case .location:
            break
        case .signOut:
            break
        }
    }
}
