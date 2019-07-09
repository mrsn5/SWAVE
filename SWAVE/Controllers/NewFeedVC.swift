//
//  NewFeedVC.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/6/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit
import Firebase

class NewFeedVC: UIViewController {

    @IBOutlet weak var topicTF: PaddedTextField!
    @IBOutlet weak var messageTV: InputTextView!
    
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddBtn()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        topicTF.delegate = self
//        messageTV.delegate = self
    }
    
    @IBAction func addPressed(_ sender: Any) {
        guard let topic = topicTF.text, let message = messageTV.text, let uid = Auth.auth().currentUser?.uid else {return}
        
        let data: Dictionary<FEED_DATA, Any> =
            [FEED_DATA.TOPIC:           topic,
             FEED_DATA.MESSAGE:         message,
             FEED_DATA.CREATION_TIME:   FieldValue.serverTimestamp(),
             FEED_DATA.USER_ID:         uid]
        
        DataService.instanse.createFeedRecord(recordData: data) { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
            } else {
                debugPrint("Error while adding new feed: \(String(describing: error?.localizedDescription))")
            }
        }
        
    }
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    func setAddBtn() {
        let addBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        addBtn.setTitle("ADD", for: .normal)
        addBtn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        addBtn.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addBtn.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 24)
        addBtn.addTarget(self, action: #selector(NewFeedVC.addPressed(_:)), for: .touchUpInside)
        topicTF.inputAccessoryView = addBtn
        messageTV.inputAccessoryView = addBtn
    }
    
    
    // MARK:- Keyboard
    @objc func keyboardWillShow(notification: NSNotification) {
        addBtn.isHidden = true
        
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
        addBtn.isHidden = false
        
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
            self.bottomConstraint.constant = 20
            self.scrollView.adjustedContentInsetDidChange()
        }
    }
    
}


extension NewFeedVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
