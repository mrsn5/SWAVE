//
//  FeedTCell.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/12/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit

@IBDesignable
class FeedTCell: UITableViewCell {

    @IBOutlet weak var topicLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var view: UIView!
    
    func configure(feed: Feed) {
        topicLbl.text = feed.topic
        messageLbl.text = feed.message + "\n"
        timeLbl.text = "\(feed.hours_left)h"
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        dashedBorder()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        dashedBorder()
    }

    func dashedBorder() {
        
    }

}
