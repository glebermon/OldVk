//
//  FriendVK.swift
//  inetsKirillL
//
//  Created by Глеб on 29/12/2018.
//  Copyright © 2018 Глеб. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

@objcMembers
class FriendVK: Object {
    
    dynamic var id: Int = 0
    dynamic var firstName: String = ""
    dynamic var lastName: String = ""
    dynamic var avatar: String = ""
    
    convenience init(json: JSON) {
        self.init()
        
        self.id = json["id"].intValue
        self.firstName = json["first_name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.avatar = json["photo_50"].stringValue
    }
    override static func primaryKey() -> String? {
        return "id"
    }
}

