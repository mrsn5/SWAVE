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
    
    
    func createFeedRecord(recordData: Dictionary<FEED_DATA, Any>,
                          completion: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        var rData : Dictionary<String, Any> = [:]
        for (key, value) in recordData {
            rData[key.rawValue] = value
        }
        
        Firestore.firestore().collection("feed").addDocument(data: rData) { (error) in
            if let error = error {
                completion(false, error)
            } else {
                completion(true, nil)
            }
        }
    }
    
    func getAllFeedRecords(complete: @escaping ([Feed]?, Error?) -> ()) {
        Firestore.firestore().collection("feed").order(by: "creation_time").addSnapshotListener({ (querySnapshot, err) in
            if let err = err {
                complete(nil, err)
            } else {
                var feed = [Feed]()
                for document in querySnapshot!.documents {
                    feed.append(Feed(id: document.documentID, data: document.data()))
                }
                complete(feed, nil)
            }
        })
    }
    
}
