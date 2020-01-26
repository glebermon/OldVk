//
//  FriendVKService.swift
//  inetsKirillL
//
//  Created by Глеб on 02/01/2019.
//  Copyright © 2019 Глеб. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire

class FriendVKService {
    
    public func loadFriendsAlamofire(completionHandler: (([FriendVK]?, Error?) -> Void)? = nil) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token" : Session.shared.token,
            "fields" : "nickname, photo_200_orig, photo_50",
            "extendet" : "1",
            "v" : "5.87"
        ]
        
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                completionHandler?(nil, error)
                print(error.localizedDescription)
            case .success(let value):
                let json = JSON(value)
                let friends = json["response"]["items"].arrayValue.map { FriendVK(json: $0) }
                completionHandler?(friends, nil)
            }
        }
    }
    
    static func urlForFriendVK(_ avatar: String) -> URL? {
        return URL(string: avatar)
    }
}
