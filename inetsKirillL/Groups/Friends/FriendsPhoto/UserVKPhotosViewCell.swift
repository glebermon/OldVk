//
//  UserVKPhotosViewCell.swift
//  inetsKirillL
//
//  Created by Глеб on 05/01/2019.
//  Copyright © 2019 Глеб. All rights reserved.
//

import UIKit
import Kingfisher

class UserVKPhotosViewCell: UICollectionViewCell {
    
    @IBOutlet weak var userPhoto: UIImageView!
    
    public func configure(with photo: UserVKPhotos) {
        self.userPhoto.kf.setImage(with: UserVKPhotosService.urlForUserVKPhoto(photo.url))
    }
}
