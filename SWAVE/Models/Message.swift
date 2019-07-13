//
//  Message.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/13/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import Foundation
import Firebase
import MessageKit

struct Message: MessageType {
    
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
    
    
}
