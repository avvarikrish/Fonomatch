//
//  Answers.swift
//  RealPhoneMatcher1
//
//  Created by Krish Avvari on 7/17/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import SwiftyJSON
import Foundation

struct Devices {
    let deviceName: String
    let brandName: String
    let displaySize: String
    let releaseDate: String
    let talkTime: String
    init (json: JSON) {
        self.deviceName = json["DeviceName"].stringValue
        self.brandName = json ["Brand"].stringValue
        self.displaySize =  json ["size"].stringValue
        self.releaseDate = json["status"].stringValue
        self.talkTime = json["talk_time"].stringValue
    }
}
