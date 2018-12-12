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
        self.tabBar.isUserInteractionEnabled = false
        self.tabBar.items?[0].image = dealsIconGray.withRenderingMode(.alwaysOriginal)
        self.tabBar.items?[0].selectedImage = dealsIconPoppin.withRenderingMode(.alwaysOriginal)
        self.tabBar.items?[0].title = nil
        self.tabBar.items?[0].imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
        
        self.tabBar.items?[1].image = mapIconGray.withRenderingMode(.alwaysOriginal)
        self.tabBar.items?[1].selectedImage = mapIconPoppin.withRenderingMode(.alwaysOriginal)
        self.tabBar.items?[1].title = nil
        self.tabBar.items?[1].imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
        
        self.tabBar.items?[2].image = settingsIconGray.withRenderingMode(.alwaysOriginal)
        self.tabBar.items?[2].selectedImage = settingsIconPoppin.withRenderingMode(.alwaysOriginal)
        self.tabBar.items?[2].title = nil
        self.tabBar.items?[2].imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
    }
}

