// File: UIImage+Resize.swift
// Purpose: <enter purpose>
// Date Created: 12/3/18
// Created By: Steven Penava

import Foundation
import UIKit

extension UIImage {
    
    func resizeImage(size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
}
