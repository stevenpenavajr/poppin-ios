// File: MBLoginController.swift
// Purpose: <enter purpose>
// Date Created: 10/29/18
// Created By: Steven Penava

import Foundation
import FBSDKLoginKit
import FirebaseAuth
import UIKit
import Gifu

class MBLoginController: UIViewController {
    
    @IBOutlet weak var backgroundGif: GIFImageView!
    
    @IBOutlet weak var beerIcon: UIImageView!
    @IBOutlet weak var signUpButtonOutlet: FBSDKLoginButton!
    
    @IBAction func signUpButton(_ sender: Any) {}
    
    @IBAction func loginButton(_ sender: Any) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButtonOutlet.layer.cornerRadius = signUpButtonOutlet.frame.height / 2
        signUpButtonOutlet.clipsToBounds = true
        signUpButtonOutlet.delegate = self
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

// MARK: FBSDKLoginButtonDelegate

extension MBLoginController: FBSDKLoginButtonDelegate {
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        // ...
    }
}
