//
//  SearchGroupsVKService.swift
//  inetsKirillL
//
//  Created by Глеб on 13/01/2019.
//  Copyright © 2019 Глеб. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

@objcMembers
class SearchGroupsVKModel: Object {
    
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


/*{
    "response": {
        "count": 111015,
        "items": [
                {
                "id": 147845620,
                "name": "VK Music",
                "screen_name": "vkmusic",
                "is_closed": 0,
                "type": "page",
                "is_admin": 0,
                "is_member": 0,
                "is_advertiser": 0,
                "photo_50": "https://sun1-5.userapi.com/c836138/v836138505/48277/hs8Xd9zAYGo.jpg?ava=1",
                "photo_100": "https://sun1-4.userapi.com/c836138/v836138505/48276/3yaDr9kg1Ac.jpg?ava=1",
                "photo_200": "https://sun1-15.userapi.com/c836138/v836138505/48274/zpW_0KOAvvI.jpg?ava=1"
                },
*/
