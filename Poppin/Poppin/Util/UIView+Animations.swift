// File: UIView+Animations.swift
// Purpose: <enter purpose>
// Date Created: 12/1/18
// Created By: Steven Penava
import UIKit

extension UIView {
    
    func toggleView(isVisible: Bool, completion: (()->Void)? = nil) {
        if isVisible { self.isHidden = false }
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = isVisible ? 1.0 : 0.0
        }) { (completed) in
            self.isHidden = !isVisible
            completion?()
        }
    }
    
}

extension UIViewController {
    
    func setTabBarHidden(_ hidden: Bool, animated: Bool = true, duration: TimeInterval = 0.2) {
        if animated {
            if let frame = self.tabBarController?.tabBar.frame {
                if !hidden { self.tabBarController?.tabBar.alpha = 1.0 }
                let factor: CGFloat = hidden ? 1 : -1
                let y = frame.origin.y + (frame.size.height * factor)
                UIView.animate(withDuration: duration, animations: {
                    self.tabBarController?.tabBar.frame = CGRect(x: frame.origin.x, y: y, width: frame.width, height: frame.height)
                }) { (complete) in
                    if hidden { self.tabBarController?.tabBar.alpha = 0.0}
                }
                return
            }
        }
        self.tabBarController?.tabBar.isHidden = hidden
    }
}
