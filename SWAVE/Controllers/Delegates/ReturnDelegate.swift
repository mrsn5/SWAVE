//
//  ReturnDelegate.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/11/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit

class ReturnDelegate: NSObject, UITextFieldDelegate {
    
    let view: UIView!
    
    init(view: UIView) {
        self.view = view
        super.init()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
