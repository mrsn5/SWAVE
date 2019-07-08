//
//  DataService.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/8/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    static let instanse = DataService()
    
    func createDBUser(uid: String, userData: Dictionary<USER_DATA, Any>) {
        var uData : Dictionary<String, Any> = [:]
        for (key, value) in userData {
            if key != USER_DATA.PASSWORD {
                uData[key.rawValue] = value
            }
        }
        
        Firestore.firestore().collection("users").document(uid).setData(uData) { (error) in
            if let error = error {
                debugPrint("Error adding user: \(error)")
            }
        }
    }
}
