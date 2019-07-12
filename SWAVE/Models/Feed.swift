//
//  Feed.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/12/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import Foundation
import Firebase

struct Feed {
    var id:String
    var topic:String
    var message:String
    var user_id:String
    var creation_time:Date
    var hours_left:Int
    
    init(id: String, data:Dictionary<String, Any>) {
        self.id = id
        self.topic = data[FEED_DATA.TOPIC.rawValue] as! String
        self.message = data[FEED_DATA.MESSAGE.rawValue] as! String
        self.user_id = data[FEED_DATA.USER_ID.rawValue] as! String
        self.creation_time = (data[FEED_DATA.CREATION_TIME.rawValue] as? Timestamp ?? Timestamp(date: Date())).dateValue()
        self.hours_left = 24 + Int(creation_time.timeIntervalSinceNow / 3600)
    }
}
