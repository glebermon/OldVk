//
//  UserVKPhotosService.swift
//  inetsKirillL
//
//  Created by Глеб on 05/01/2019.
//  Copyright © 2019 Глеб. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire

class UserVKPhotosService {
    
    public func loadUsersPhotosAlamofire(for user: String, completionHandler: (([UserVKPhotos]?, Error?) -> Void)? = nil) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/photos.getAll"
        
        let params: Parameters = [
            "access_token" : Session.shared.token,
            "owner_id" : user,
            "extended" : "1",
            "count" : "200",
            "v" : "5.92"
        ]
        
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                completionHandler?(nil, error)
                print(error.localizedDescription)
            case .success(let value):
                let json = JSON(value)
                let photos = json["response"]["items"].arrayValue.map { UserVKPhotos(json: $0) }
                completionHandler?(photos, nil)
            }
        }
    }
    
    static func urlForUserVKPhoto(_ photo: String) -> URL? {
        return URL(string: photo)
    }
}
