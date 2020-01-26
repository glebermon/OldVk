//
//  NewsModel.swift
//  inetsKirillL
//
//  Created by Глеб on 24/11/2018.
//  Copyright © 2018 Глеб. All rights reserved.
//

import Foundation
import UIKit

struct News {
    var newTxt : String
    var newImg : UIImage
    
    init(text: String, img: UIImage) {
        self.newTxt = text
        self.newImg = img
    }
    
}
