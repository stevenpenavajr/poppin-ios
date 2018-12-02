//
//  CustomNavigationBarController.swift
//  Poppin
//
//  Created by Blake Swaidner on 12/1/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import UIKit

class CustomNavigationBarController: UINavigationController {
    
    let titleView: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = Theme.Color.primaryBlue
        label.font = UIFont(name: "Touche-Bold", size: 18)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitleView()
        self.navigationBar.tintColor = .black
        self.navigationBar.isTranslucent = false
    }
    
    func setupTitleView() {
        view.addSubview(titleView)
        var guides = view.layoutMarginsGuide
        if #available(iOS 11, *) { guides = view.safeAreaLayoutGuide }
        titleView.centerXAnchor.constraint(equalTo: guides.centerXAnchor).isActive = true
        titleView.topAnchor.constraint(equalTo: guides.topAnchor, constant: 10).isActive = true
        titleView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func updateNavigationTitle(to title: String?) {
        guard let title = title else { return }
        titleView.text = title
    }
    
}
