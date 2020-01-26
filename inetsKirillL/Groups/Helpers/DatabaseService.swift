//
//  DatabaseService.swift
//  inetsKirillL
//
//  Created by Глеб on 18/01/2019.
//  Copyright © 2019 Глеб. All rights reserved.
//

import RealmSwift

class DatabaseService {
    
    @discardableResult
    static func saveToRealm<T: Object>(items: [T], config: Realm.Configuration = Realm.Configuration.defaultConfiguration, update: Bool = true) throws -> Realm {
        print(config.fileURL ?? "")
        let ream = try Realm(configuration: config)
        
        try ream.write {
            ream.add(items, update: true)
        }
        return ream
    }
    
    static func deletFromRealm(items: [Object]) {
        let realm = try? Realm()
        
        ((try? realm?.write {
            realm?.delete(items)
        }) as ()??)
//        return realm
    }
    
}
