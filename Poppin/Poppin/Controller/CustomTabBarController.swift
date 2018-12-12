//
//  CustomTabBarController.swift
//  Poppin
//
//  Created by Blake Swaidner on 12/7/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {
    
    let mapIconGray = UIImage(named: "map-gray")!.resizeImage(size: CGSize(width: 30, height: 30))
    let mapIconPoppin = UIImage(named: "map-poppin")!.resizeImage(size: CGSize(width: 30, height: 30))
    
    let dealsIconGray = UIImage(named: "deals-gray")!.resizeImage(size: CGSize(width: 35, height: 35))
    let dealsIconPoppin = UIImage(named: "deals-poppin")!.resizeImage(size: CGSize(width: 35, height: 35))
    
    let settingsIconGray = UIImage(named: "settings-1-gray")!.resizeImage(size: CGSize(width: 30, height: 30))
    let settingsIconPoppin = UIImage(named: "settings-1-poppin")!.resizeImage(size: CGSize(width: 30, height: 30))

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func styleTabBar(_ poppinTabBar: UITabBar) {
        
        let icons = [[dealsIconGray, dealsIconPoppin], [mapIconGray, mapIconPoppin], [settingsIconGray, settingsIconPoppin]]
        
        for i in 0..<icons.count {
            self.tabBar.items?[i].image = icons[i][0].withRenderingMode(.alwaysOriginal)
            self.tabBar.items?[i].selectedImage = icons[i][1].withRenderingMode(.alwaysOriginal)
            self.tabBar.items?[i].title = nil
            self.tabBar.items?[i].imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
        }
    }
}

