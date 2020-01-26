//
//  PhotoCommentsModel.swift
//  inetsKirillL
//
//  Created by Глеб on 13/01/2019.
//  Copyright © 2019 Глеб. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

@objcMembers
class PhotoCommentsModel: Object {
    
    dynamic var id : Int = 0
    dynamic var fromId : Int = 0
    dynamic var comment : String = ""
    dynamic var date : Int = 0
    
    convenience init(json: JSON) {
        self.init()
//        self.commentsCount = json["count"].intValue
        self.id = json["id"].intValue
        self.fromId = json["from_id"].intValue
        self.comment = json["text"].stringValue
        self.date = json["date"].intValue
    }
    
    
}



/*
{
    "response": {
        "count": 7,
        "items": [
                {
                "id": 418,
                "from_id": 174070229,
                "parents_stack": [],
                "date": 1544638992,
                "text": "Это случайно не Пальма-де-Майорка?)",
                "thread": {
                "count": 0
                }
                },
                {
                "id": 419,
                "from_id": 7770381,
                "parents_stack": [],
                "date": 1544640031,
                "text": "Сразу мультфильм Горбун из Нотер-дама вспомнил)",
                "thread": {
                "count": 0
                }
                },
                {
                "id": 420,
                "from_id": 134957749,
                "parents_stack": [],
                "date": 1544640097,
                "text": "[id174070229|Alexander], хах) это Барселона))",
                "reply_to_user": 174070229,
                "reply_to_comment": 418,
                "thread": {
                "count": 0
                }
                },
                {
                "id": 421,
                "from_id": 134957749,
                "parents_stack": [],
                "date": 1544640320,
                "text": "[id7770381|Dmitry], хах, любопытно 😅",
                "reply_to_user": 7770381,
                "reply_to_comment": 419,
                "thread": {
                "count": 0
                }
                },
                {
                "id": 422,
                "from_id": 279035181,
                "parents_stack": [],
                "date": 1544693373,
                "text": "Красавица🌷",
                "thread": {
                "count": 0
                }
                },
                {
                "id": 423,
                "from_id": 134957749,
                "parents_stack": [],
                "date": 1544699779,
                "text": "[id279035181|Alyona], спасибо☺️",
                "reply_to_user": 279035181,
                "reply_to_comment": 422,
                "thread": {
                "count": 0
                }
                },
                {
                "id": 424,
                "from_id": 145861207,
                "parents_stack": [],
                "date": 1544734506,
                "text": "Какая позитивная )",
                "thread": {
                "count": 0
                }
        }
        ],
        "profiles": [
        {
        "id": 7770381,
        "first_name": "Дмитрий",
        "last_name": "Заворотный",
        "is_closed": false,
        "can_access_closed": true,
        "sex": 2,
        "screen_name": "dmakinc",
        "photo_50": "https://pp.userapi.com/c830608/v830608904/1e44c4/qKf2nBu7V2M.jpg?ava=1",
        "photo_100": "https://pp.userapi.com/c830608/v830608904/1e44c3/frRItlfNQp8.jpg?ava=1",
        "online": 0
        },
        {
        "id": 134957749,
        "first_name": "Elena",
        "last_name": "Rudiak",
        "is_closed": false,
        "can_access_closed": true,
        "sex": 1,
        "screen_name": "esther_ngate",
        "photo_50": "https://pp.userapi.com/c847218/v847218492/1508e6/8W7NR2lDo14.jpg?ava=1",
        "photo_100": "https://pp.userapi.com/c847218/v847218492/1508e5/fY4P3EEpXL4.jpg?ava=1",
        "online": 0
        },
        {
        "id": 145861207,
        "first_name": "Дмитрий",
        "last_name": "Извеков",
        "is_closed": false,
        "can_access_closed": true,
        "sex": 2,
        "screen_name": "izvekov71",
        "photo_50": "https://pp.userapi.com/c849432/v849432635/7d07e/24Qu554iZ_4.jpg?ava=1",
        "photo_100": "https://pp.userapi.com/c849432/v849432635/7d07d/LcgcoH9T-xY.jpg?ava=1",
        "online": 0
        },
        {
        "id": 174070229,
        "first_name": "Александр",
        "last_name": "Руденко",
        "is_closed": false,
        "can_access_closed": true,
        "sex": 2,
        "screen_name": "rudenko_alexander_vladimirovich",
        "photo_50": "https://pp.userapi.com/c847018/v847018456/1628b9/SiJwmPA50Mg.jpg?ava=1",
        "photo_100": "https://pp.userapi.com/c847018/v847018456/1628b8/M_euoUvnQSs.jpg?ava=1",
        "online": 0
        },
        {
        "id": 279035181,
        "first_name": "Алена",
        "last_name": "Толкунова",
        "is_closed": false,
        "can_access_closed": true,
        "sex": 1,
        "screen_name": "id279035181",
        "photo_50": "https://pp.userapi.com/c834201/v834201334/1292e1/GiOkKxEpwpc.jpg?ava=1",
        "photo_100": "https://pp.userapi.com/c834201/v834201334/1292e0/CVzN4RTv1Os.jpg?ava=1",
        "online": 0
        }
        ],
        "groups": []
    }
}
*/
