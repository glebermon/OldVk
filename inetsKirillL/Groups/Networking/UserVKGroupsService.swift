//
//  UserVKGroups.swift
//  inetsKirillL
//
//  Created by Глеб on 13/01/2019.
//  Copyright © 2019 Глеб. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserVKGroupsService {
    
    public func loadUserGroupsAlamofire(completionHandler: (([GroupsVKModel]?, Error?) -> Void)? = nil) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token" : Session.shared.token,
            "extended" : "1",
            "fields" : "is_closed",
            "v" : "5.92"
        ]
        
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                completionHandler?(nil, error)
                print(error.localizedDescription)
            case .success(let value):
                let json = JSON(value)
                let group = json["response"]["items"].arrayValue.map { GroupsVKModel(json: $0) }
                completionHandler?(group, nil)
            }
        }
    }
    
    static func urlForGroupsVK(_ avatar: String) -> URL? {
        return URL(string: avatar)
    }
}
