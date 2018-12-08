// File: UITabBar+Resize.swift
// Purpose: <enter purpose>
// Date Created: 12/6/18
// Created By: Steven Penava

import Foundation
import UIKit

extension UITabBar {
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: size.width, height: 50.0)
    }
}
