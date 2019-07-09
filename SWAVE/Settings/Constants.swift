//
//  Constants.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/6/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import Foundation

let ROUNDNESS = 10.0

enum USER_DATA: String {
    case USERNAME = "username"
    case EMAIL = "email"
    case PASSWORD = "password"
    case PROVIDER = "provider"
}

enum FEED_DATA: String {
    case TOPIC = "topic"
    case MESSAGE = "message"
    case CREATION_TIME = "creation_time"
    case USER_ID = "user_id"
}
