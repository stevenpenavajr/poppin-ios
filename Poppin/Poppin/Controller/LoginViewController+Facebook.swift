//
//  LoginViewController+Facebook.swift
//  Poppin
//
//  Created by Blake Swaidner on 11/30/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import Gifu
import FBSDKLoginKit
import FirebaseAuth
import UIKit

// MARK: FBSDKLoginButtonDelegate

extension LoginViewController: FBSDKLoginButtonDelegate {
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if let error = error {
//            print(error.localizedDescription)
            return
        } else {
            let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            
            Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
                if let error = error {
//                    print(error.localizedDescription)
                    return
                }
//                print("User signed in")
                self.checkAuthStatus()
            }
        }
    }
}
