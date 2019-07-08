//
//  AuthService.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/8/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthService {
    static let instance = AuthService()
    
    func registerUser(userData: Dictionary<USER_DATA, Any>,
                      userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: userData[USER_DATA.EMAIL] as! String, password: userData[USER_DATA.PASSWORD] as! String) { (user, error) in
            guard let user = user else {
                userCreationComplete(false, error)
                return
            }
            
            DataService.instanse.createDBUser(uid: user.user.uid, userData: userData)
            userCreationComplete(true, nil)
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String,
                   loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                loginComplete(false, error)
                return
            }
            
            loginComplete(true, nil)
        }
    }
    
    func signOut(completion: @escaping (_ status: Bool, _ error: NSError?) -> ()) {
        do {
            try Auth.auth().signOut()
            completion(true, nil)
        } catch let error as NSError {
            completion(false, error)
        }
        
    }
    
    
}
