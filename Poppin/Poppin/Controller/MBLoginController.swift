// File: MBLoginController.swift
// Purpose: <enter purpose>
// Date Created: 10/29/18
// Created By: Steven Penava

import Foundation
import UIKit
import Gifu

class MBLoginController: UIViewController {
    
    @IBOutlet weak var backgroundGif: GIFImageView!
    
    @IBOutlet weak var beerIcon: UIImageView!
    @IBOutlet weak var signUpButtonOutlet: UIButton!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    
    @IBAction func signUpButton(_ sender: Any) {}
    
    @IBAction func loginButton(_ sender: Any) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButtonOutlet.layer.cornerRadius = signUpButtonOutlet.frame.height / 2
        signUpButtonOutlet.clipsToBounds = true
        
        loginButtonOutlet.layer.cornerRadius = signUpButtonOutlet.frame.height / 2
        loginButtonOutlet.clipsToBounds = true
        
        backgroundGif.animate(withGIFNamed: "beer-pour-blur-new") {
            print("It's animating!")
        }
        
        let pulse = CAKeyframeAnimation(keyPath: "transform.scale")
        pulse.duration = 3
        pulse.values = [0.8, 0.9, 0.8]
        pulse.keyTimes = [0, 0.5, 1.0]
        pulse.repeatCount = Float.infinity
        beerIcon.layer.add(pulse, forKey: "pulse")
    }
    
}
