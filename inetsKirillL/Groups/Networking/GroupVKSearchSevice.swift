//
//  GroupVKSearchSevice.swift
//  inetsKirillL
//
//  Created by Глеб on 13/01/2019.
//  Copyright © 2019 Глеб. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class GroupVKSearchSevice {
    
    public func loadSearchGroupsVKAlamofire(completionHandler: (([SearchGroupsVKModel]?, Error?) -> Void)? = nil) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.search"
        
        let params: Parameters = [
            "access_token" : Session.shared.token,
            "extendet" : "1",
            "q" : "music",
            "fields" : "members_count",
            "v" : "5.92"
        ]
        
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                completionHandler?(nil, error)
                print(error.localizedDescription)
            case .success(let value):
                let json = JSON(value)
                let group = json["response"]["items"].arrayValue.map { SearchGroupsVKModel(json: $0) }
                completionHandler?(group, nil)
            }
        }
    }
    
    static func urlForSearchGroupsVK(_ avatar: String) -> URL? {
        return URL(string: avatar)
    }
}
