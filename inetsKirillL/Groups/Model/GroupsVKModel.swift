//
//  GroupsVKModel.swift
//  inetsKirillL
//
//  Created by Глеб on 13/01/2019.
//  Copyright © 2019 Глеб. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

@objcMembers
class GroupsVKModel: Object {
    
    dynamic var id : Int = 0
    dynamic var name : String = ""
    dynamic var type : String = ""
    dynamic var isMember : Int = 0
    dynamic var avatar : String = ""
    
    convenience init(json: JSON) {
        self.init()
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.type = json["type"].stringValue
        self.isMember = json["is_member"].intValue
        self.avatar = json["photo_50"].stringValue
    }
}


/*
{
    "response": {
        "count": 157,
        "items": [
            {
            "id": 33913959,
            "name": "The Gentleman",
            "screen_name": "i.gentleman",
            "is_closed": 0,
            "type": "page",
            "is_admin": 0,
            "is_member": 1,
            "is_advertiser": 0,
            "photo_50": "https://sun1-2.userapi.com/c841431/v841431218/7937/5t3Roksw31Q.jpg?ava=1",
            "photo_100": "https://sun1-13.userapi.com/c841431/v841431218/7936/LWXa2fdoWyQ.jpg?ava=1",
            "photo_200": "https://sun1-4.userapi.com/c841431/v841431218/7935/CCnfrw5zoYY.jpg?ava=1"
        },
*/
