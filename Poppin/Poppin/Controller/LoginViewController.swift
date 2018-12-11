// File: MBLoginController.swift
// Purpose: <enter purpose>
// Date Created: 10/29/18
// Created By: Steven Penava

import Gifu
import FBSDKLoginKit
import FirebaseAuth
import UIKit

class LoginViewController: UIViewController {
    
    private var handle: AuthStateDidChangeListenerHandle?
    
    @IBOutlet weak var backgroundGif: GIFImageView!
    @IBOutlet weak var beerIcon: UIImageView!
    @IBOutlet weak var loginButton: UIButton!

    private let facebookButton = FBSDKLoginButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        loginButton.clipsToBounds = true
        facebookButton.readPermissions = ["public_profile", "email"]
        facebookButton.delegate = self
        startLoginAnimations()
        checkAuthStatus()
    }
    
    func checkAuthStatus() {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.getFacebookUserData()
                self.performSegue(withIdentifier: "LoginSegue", sender: self)
            }
        }
    }
    
    func startLoginAnimations() {
        backgroundGif.animate(withGIFNamed: "beer-pour-blur-new")
        let pulse = CAKeyframeAnimation(keyPath: "transform.scale")
        pulse.duration = 3
        pulse.values = [0.8, 0.9, 0.8]
        pulse.keyTimes = [0, 0.5, 1.0]
        pulse.repeatCount = Float.infinity
        beerIcon.layer.add(pulse, forKey: "pulse")
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        facebookButton.sendActions(for: .touchUpInside)
    }
    
}
