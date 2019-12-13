//
//  DatabaseManger.swift
//  MyAlarm
//
//  Created by Yehia Samak on 12/11/19.
//  Copyright © 2019 Yehia Samak. All rights reserved.
//

import Foundation
import RealmSwift

class DatabaseManger{
    
    static func saveAlarm(_ alarm: Alarm){
        let realm = try! Realm()
        try! realm.write() {
            realm.add(alarm)
        }
    }
    
    static func queryAllAlarms() -> [Alarm]{
        let realm = try! Realm()
        let alarms = realm.objects(Alarm.self)
        return Array(alarms)
    }
    
    
}
