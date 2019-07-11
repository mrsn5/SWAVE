//
//  SettingsVC.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/8/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signOutPressed(_ sender: Any) {
        AuthService.instance.signOut { (success, error) in
            if success {
                guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return }
                
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let authVC = storyboard.instantiateViewController(withIdentifier: "AuthVC")
                appDel.window?.makeKeyAndVisible()
                appDel.window?.rootViewController?.present(authVC, animated: true, completion: nil)
            } else {
                debugPrint("Error while signing out: \(String(describing: error?.localizedDescription))")
            }
        }
    }
}
