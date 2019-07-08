//
//  TopLabel.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/6/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit

@IBDesignable
class TopLabel: UILabel {

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        alignTop()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        alignTop()
    }
    
    func alignTop() {
        sizeToFit()
    }
    
    

}
