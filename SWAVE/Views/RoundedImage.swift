//
//  RoundedImage.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/6/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedImage: UIImageView {

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        roundAndFill()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundAndFill()
    }

    func roundAndFill() {
        layer.cornerRadius = layer.frame.size.width / 2
        contentMode = .scaleAspectFill
    }
}
