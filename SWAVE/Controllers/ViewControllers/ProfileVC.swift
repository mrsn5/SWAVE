//
//  ProfileVC.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/6/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {

    @IBOutlet weak var usernameLbl: TopLabel!
    @IBOutlet weak var userInfoLbl: TopLabel!
    @IBOutlet weak var userPhoto: RoundedImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUser()
        
    }
    
    func configureUser() {
        self.userPhoto.image = nil
        self.usernameLbl.text = nil
        self.userInfoLbl.text = nil
        StorageService.instanse.getUserPhoto { (image, error) in
            guard let image = image else {return}
            self.userPhoto.image = image
        }
        DataService.instanse.getCurrentUserData { (data, error) in
            guard let data = data else {return}
            self.usernameLbl.text = data[USER_DATA.USERNAME.rawValue] as! String
            if let info = data[USER_DATA.USER_INFO.rawValue] as? String {
                self.userInfoLbl.text = info
            }
        }
    }

}
