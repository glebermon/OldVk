//
//  FriendsPhotosModel.swift
//  inetsKirillL
//
//  Created by Глеб on 17/11/2018.
//  Copyright © 2018 Глеб. All rights reserved.
//

import Foundation
import UIKit

struct FrindsPhoto {
    let friend: String
    let photos: [UIImage]
    
    init(friend: String, photos: [UIImage]) {
        self.friend = friend
        self.photos = photos
    }
}
