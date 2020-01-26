//
//  NetworkSevice.swift
//  inetsKirillL
//
//  Created by Глеб on 20/12/2018.
//  Copyright © 2018 Глеб. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


class NetworkServiceAlamofire {
    
    public func loadUserGroupsAlamofire() {
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
                print(error.localizedDescription)
            case .success(let value):
                print(value)
            }
        }
    }
    
    public func loadUserFriendsAlamofire() {
        let baseUrl = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token" : Session.shared.token,
            "fields" : "nickname, photo_200_orig, photo_50",
            "extended" : "1",
            "v" : "5.87"
        ]
        
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                print(value)
            }
        }
    }
    
    public func loadUserPhotosAlamofire() {
        let baseUrl = "https://api.vk.com"
        let path = "/method/photos.getAll"
        
        let params: Parameters = [
            "access_token" : Session.shared.token,
            "owner_id" : "59614307",
            "extendet" : "1",
            "v" : "5.87"
        ]
        
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                print(value)
            }
        }
    }
    
    public func loadSearchGroupsAlamofire() {
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
                print(error.localizedDescription)
            case .success(let value):
                print(value)
            }
        }
    }
}
