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
    
    var akv: AdjustKeyboardView!
    var textFieldDelegate: UITextFieldDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let kb = KeyboardButton(title: "ADD") { (button) in
            button.addTarget(self, action: #selector(NewFeedVC.addPressed(_:)), for: .touchUpInside)
        }
        kb.setButton(forTextField: topicTF)
        kb.setButton(forTextView: messageTV)
        
        akv = AdjustKeyboardView(viewController: self, button: addBtn, bottomConstraint: bottomConstraint, scrollView: scrollView)
        
        textFieldDelegate = ReturnDelegate(view: self.view)
        topicTF.delegate = textFieldDelegate
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
    
}
