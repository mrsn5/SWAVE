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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLoginBtn()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        emailTF.delegate = self
        passwordTF.delegate = self
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
    
    func setLoginBtn() {
        let loginBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        loginBtn.setTitle("LOGIN", for: .normal)
        loginBtn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        loginBtn.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        loginBtn.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 24)
        loginBtn.addTarget(self, action: #selector(LoginVC.loginPressed(_:)), for: .touchUpInside)
        emailTF.inputAccessoryView = loginBtn
        passwordTF.inputAccessoryView = loginBtn
    }
    
    
    // MARK:- Keyboard
    @objc func keyboardWillShow(notification: NSNotification) {
        loginBtn.isHidden = true
        
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
        loginBtn.isHidden = false
        
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
            self.bottomConstraint.constant = 20
            self.scrollView.adjustedContentInsetDidChange()
        }
    }
    
}


extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
