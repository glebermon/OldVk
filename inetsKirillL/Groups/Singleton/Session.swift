//
//  Session.swift
//  inetsKirillL
//
//  Created by Глеб on 17/12/2018.
//  Copyright © 2018 Глеб. All rights reserved.
//

import UIKit

class Session {
    private init() { }
    
    public static let shared = Session()
    
    var token = ""
    var userID = 0
    
    
}
