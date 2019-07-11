//
//  RegisterVC.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/6/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var usernameTF: PaddedTextField!
    @IBOutlet weak var emailTF: PaddedTextField!
    @IBOutlet weak var passwordTF: PaddedTextField!
    @IBOutlet weak var repeatTF: PaddedTextField!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var registerBtn: UIButton!
    
    var akv: AdjustKeyboardView!
    var textFieldDelegate: UITextFieldDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        akv = AdjustKeyboardView(viewController: self, button: registerBtn, bottomConstraint: bottomConstraint, scrollView: scrollView)
        
        let kb = KeyboardButton(title: "REGISTER") { (button) in
            button.addTarget(self, action: #selector(RegisterVC.registerPressed(_:)), for: .touchUpInside)
        }
        kb.setButton(forTextField: usernameTF)
        kb.setButton(forTextField: passwordTF)
        kb.setButton(forTextField: emailTF)
        kb.setButton(forTextField: repeatTF)
        
        textFieldDelegate = ReturnDelegate(view: self.view)
        usernameTF.delegate = textFieldDelegate
        emailTF.delegate = textFieldDelegate
        passwordTF.delegate = textFieldDelegate
        repeatTF.delegate = textFieldDelegate
        
    }
      
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        
        guard let username = usernameTF.text, let email = emailTF.text, let password = passwordTF.text, let repeatP = repeatTF.text else {return}
        guard password == repeatP else {return}
    
        let userData = [USER_DATA.USERNAME: username,
                        USER_DATA.EMAIL:    email,
                        USER_DATA.PASSWORD: password]
        AuthService.instance.registerUser(userData: userData) { (success, error) in
            
            guard success else {
                debugPrint("Error while registering new user: \(String(describing: error?.localizedDescription))")
                return
            }
            
            AuthService.instance.loginUser(withEmail: email, andPassword: password, loginComplete: { (success, error) in
                
                guard success else {
                    debugPrint("Error while registering new user: \(String(describing: error?.localizedDescription))")
                    return
                }
                
                self.performSegue(withIdentifier: "MainVC", sender: nil)
            })
            
        }
        
    }
}
