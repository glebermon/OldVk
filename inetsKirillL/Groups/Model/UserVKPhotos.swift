//
//  UserVKPhotos.swift
//  inetsKirillL
//
//  Created by Глеб on 04/01/2019.
//  Copyright © 2019 Глеб. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

@objcMembers
class UserVKPhotos: Object {
    
    
    dynamic var id : Int = 0
    dynamic var album_id : Int = 0
    
    dynamic var type : String = ""
    dynamic var url : String = ""
    dynamic var likes : Int = 0
    dynamic var userLike : Int = 0
    
    convenience init(json: JSON) {
        self.init()
        
        self.id = json["id"].intValue
        self.album_id = json["album_id"].intValue
        self.type = json["sizes"][3]["type"].stringValue
        self.url = json["sizes"][3]["url"].stringValue
        self.likes = json["likes"]["count"].intValue
        self.userLike = json["likes"]["user_likes"].intValue
    }
}

/*
{
    "response": {
        "count": 111,
        "items": [
            {
            "id": 456239106,
            "album_id": -7,
            "owner_id": 272198942,
            "sizes": [
            {
                "type": "m",
                "url": "https://pp.userapi.com/c845323/v845323400/e0a73/jUxHs6lnnxU.jpg",
                "width": 97,
                "height": 130
                },
                {
                "type": "o",
                "url": "https://pp.userapi.com/c845323/v845323400/e0a77/4UMVuJvUw78.jpg",
                "width": 130,
                "height": 173
                },
                {
                "type": "p",
                "url": "https://pp.userapi.com/c845323/v845323400/e0a78/HyzrgpD0LGA.jpg",
                "width": 200,
                "height": 267
                },
                {
                "type": "q",
                "url": "https://pp.userapi.com/c845323/v845323400/e0a79/NtfBaqnSU2A.jpg",
                "width": 320,
                "height": 427
                },
                {
                "type": "r",
                "url": "https://pp.userapi.com/c845323/v845323400/e0a7a/NleME7aWLIE.jpg",
                "width": 510,
                "height": 680
                },
                {
                "type": "s",
                "url": "https://pp.userapi.com/c845323/v845323400/e0a72/B7hXfbaXqz8.jpg",
                "width": 56,
                "height": 75
                },
                {
                "type": "x",
                "url": "https://pp.userapi.com/c845323/v845323400/e0a74/2cat5HOlJH4.jpg",
                "width": 453,
                "height": 604
                },
                {
                "type": "y",
                "url": "https://pp.userapi.com/c845323/v845323400/e0a75/CuABRElzYnY.jpg",
                "width": 605,
                "height": 807
                },
                {
                "type": "z",
                "url": "https://pp.userapi.com/c845323/v845323400/e0a76/9HvybycC7iI.jpg",
                "width": 720,
                "height": 960
                }
        ],
        "text": "",
        "date": 1535932611,
        "lat": 43.119293,
        "long": 131.882085
}
*/
