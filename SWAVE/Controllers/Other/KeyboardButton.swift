//
//  KeyboardButton.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/10/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit


class KeyboardButton {
    
    let button: UIButton!
    
    init(title: String, action: (UIButton) -> ()) {
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 1000, height: 50))
        button.setTitle(title, for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 24)
        action(button)
    }
    
    func setButton(forTextField tf: UITextField) {
        tf.inputAccessoryView = button
    }
    
    func setButton(forTextView tv: UITextView) {
        tv.inputAccessoryView = button
    }
}
