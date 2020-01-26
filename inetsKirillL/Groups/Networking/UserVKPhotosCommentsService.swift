//
//  PhotoComments.swift
//  inetsKirillL
//
//  Created by Глеб on 13/01/2019.
//  Copyright © 2019 Глеб. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class UserVKPhotosCommentsService {
    
    public func loadUsersPhotoCommentsAlamofire(for photoID: String, for user: String, completionHandler: (([PhotoCommentsModel]?, Error?) -> Void)? = nil) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/photos.getComments"
        
        let params: Parameters = [
            "access_token" : Session.shared.token,
            "owner_id" : user,
            "photo_id" : photoID,
            "extended" : "1",
            "count" : "100",
            "sort" : "asc",
            "v" : "5.92"
        ]
        
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                completionHandler?(nil, error)
                print(error.localizedDescription)
            case .success(let value):
                let json = JSON(value)
                let comments = json["response"]["items"].arrayValue.map { PhotoCommentsModel(json: $0) }
                completionHandler?(comments, nil)
            }
        }
    }
    
    static func urlForUserVKPhoto(_ photo: String) -> URL? {
        return URL(string: photo)
    }
}
