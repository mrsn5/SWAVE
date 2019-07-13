//
//  AdjustKeyboardView.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/10/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit

protocol AdjustKeyboardViewProtocol {
    func keyboardWillShow(notification: NSNotification)
    func keyboardWillHide(notification: NSNotification)
}

class AdjustKeyboardView: AdjustKeyboardViewProtocol {
    
    let viewController: UIViewController!
    let button: UIButton!
    var bottomConstraint: NSLayoutConstraint!
    let scrollView: UIScrollView!
    
    init(viewController: UIViewController, button: UIButton, bottomConstraint: NSLayoutConstraint, scrollView: UIScrollView) {
        self.viewController = viewController
        self.button = button
        self.bottomConstraint = bottomConstraint
        self.scrollView = scrollView
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        button.isHidden = true
        
        if let info = notification.userInfo {
            let rect = info["UIKeyboardFrameEndUserInfoKey"] as! CGRect
            viewController.view.layoutIfNeeded()
            UIView.animate(withDuration: 0.25) {
                self.viewController.view.layoutIfNeeded()
                self.bottomConstraint.constant = rect.height - 90
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        button.isHidden = false
        
        UIView.animate(withDuration: 0.25) {
            self.viewController.view.layoutIfNeeded()
            self.bottomConstraint.constant = 20
            self.scrollView.adjustedContentInsetDidChange()
        }
    }
}
