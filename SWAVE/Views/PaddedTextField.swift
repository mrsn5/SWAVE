//
//  AuthTextField.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/5/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit

@IBDesignable
class PaddedTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        addPadding()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        addPadding()
    }
    
    func addPadding() {
        let paddingView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        leftView = paddingView
        rightView = paddingView
        leftViewMode = .always
        rightViewMode = .always
    }

}
