//
//  InputTextView.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/6/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit

@IBDesignable
class InputTextView: UITextView {

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        border()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        border()
    }
    
    func border() {
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textContainerInset = UIEdgeInsets(top: 3, left: 10, bottom: 3, right: 10)
    }

}
