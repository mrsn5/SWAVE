//
//  FeedTCell.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/12/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit

class FeedTCell: UITableViewCell {

    @IBOutlet weak var topicLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    
    func configure(feed: Feed) {
        topicLbl.text = feed.topic
        messageLbl.text = feed.message
        timeLbl.text = "\(feed.hours_left)h"
    }

}
