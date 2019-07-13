//
//  StorageService.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/13/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import Foundation
import Firebase

class StorageService {
    static let instanse = StorageService()
    
    func getUserPhoto(complete: @escaping (UIImage?, Error?) -> ()) {
        Storage.storage().reference(withPath: "user-default.jpg").getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                complete(nil, error)
            } else {
                let image = UIImage(data: data!)
                complete(image, nil)
            }
        }
    }
}
