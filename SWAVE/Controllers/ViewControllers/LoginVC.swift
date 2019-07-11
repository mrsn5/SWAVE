//
//  LoginVC.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/6/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    
    @IBOutlet weak var emailTF: PaddedTextField!
    @IBOutlet weak var passwordTF: PaddedTextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var akv: AdjustKeyboardView!
    var textFieldDelegate: UITextFieldDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let kb = KeyboardButton(title: "LOGIN") { (button) in
            button.addTarget(self, action: #selector(LoginVC.loginPressed(_:)), for: .touchUpInside)
        }
        kb.setButton(forTextField: emailTF)
        kb.setButton(forTextField: passwordTF)
        
        akv = AdjustKeyboardView(viewController: self, button: loginBtn, bottomConstraint: bottomConstraint, scrollView: scrollView)
        
        textFieldDelegate = ReturnDelegate(view: self.view)
        emailTF.delegate = textFieldDelegate
        passwordTF.delegate = textFieldDelegate
    }
    

    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        guard let email = emailTF.text, let password = passwordTF.text else {
            return
        }
        
        AuthService.instance.loginUser(withEmail: email, andPassword: password) { (success, error) in
            if success {
                self.performSegue(withIdentifier: "MainVC", sender: nil)
            } else {
                debugPrint("Error while login")
            }
        }
        
    }
}
