//
//  LoginViewController+Facebook.swift
//  Poppin
//
//  Created by Blake Swaidner on 11/30/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import Gifu
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseAuth
import UIKit

// MARK: FBSDKLoginButtonDelegate

extension LoginViewController: FBSDKLoginButtonDelegate {
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error?.localizedDescription)
            print("Facebook error... proceeding to deals with test data")
            
            ContentManager.shared.updateCurrentUser(name: "Blake Swaidner", email: "blake.swaidner@gmail.com")
            self.performSegue(withIdentifier: "LoginSegue", sender: self)
        } else {
            
            let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            
            Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                self.checkAuthStatus()
            }
            
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    func getFacebookUserData() {
        if FBSDKAccessToken.current() != nil {
            FBSDKGraphRequest(graphPath: "me",
                              parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler:{ (connection, result, error) -> Void in
                if error != nil {
                    print(error?.localizedDescription)
                } else {
                    print("Blake")
                    print(result)
                }
            })
        }
    }
    
}
