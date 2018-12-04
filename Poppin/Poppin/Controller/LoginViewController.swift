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
    @IBOutlet weak var signUpButtonOutlet: FBSDKLoginButton!
    
    @IBAction func signUpButton(_ sender: Any) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButtonOutlet.layer.cornerRadius = signUpButtonOutlet.frame.height / 2
        signUpButtonOutlet.clipsToBounds = true
        signUpButtonOutlet.delegate = self
        startLoginAnimations()
        checkAuthStatus()
    }
    
    func checkAuthStatus() {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            print("HEERE")
            if user != nil {
                print("HERE")
                self.performSegue(withIdentifier: "LoginSegue", sender: self)
            }
        }
    }
    
    func startLoginAnimations() {
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
