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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        setRegisterBtn()
        
        usernameTF.delegate = self
        emailTF.delegate = self
        passwordTF.delegate = self
        repeatTF.delegate = self
        
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
    
    func setRegisterBtn() {
        let registerBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        registerBtn.setTitle("REGISTER", for: .normal)
        registerBtn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        registerBtn.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        registerBtn.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 24)
        registerBtn.addTarget(self, action: #selector(RegisterVC.registerPressed(_:)), for: .touchUpInside)
        usernameTF.inputAccessoryView = registerBtn
        emailTF.inputAccessoryView = registerBtn
        passwordTF.inputAccessoryView = registerBtn
        repeatTF.inputAccessoryView = registerBtn
    }
    
    
    // MARK:- Keyboard
    @objc func keyboardWillShow(notification: NSNotification) {
        registerBtn.isHidden = true
        
        if let info = notification.userInfo {
            let rect = info["UIKeyboardFrameEndUserInfoKey"] as! CGRect
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 0.25) {
                self.view.layoutIfNeeded()
                self.bottomConstraint.constant = rect.height - 90
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        registerBtn.isHidden = false
        
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
            self.bottomConstraint.constant = 20
            self.scrollView.adjustedContentInsetDidChange()
        }
    }

}


extension RegisterVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
