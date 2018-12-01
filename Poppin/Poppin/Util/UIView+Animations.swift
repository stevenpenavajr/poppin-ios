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
