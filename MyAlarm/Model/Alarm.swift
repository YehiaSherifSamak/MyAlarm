//
//  Alarm.swift
//  MyAlarm
//
//  Created by Yehia Samak on 12/5/19.
//  Copyright © 2019 Yehia Samak. All rights reserved.
//

import Foundation
import RealmSwift

class Alarm: Object {
    @objc dynamic var message: String = ""
    @objc dynamic var on: Bool = true
    @objc dynamic var am: Bool = true
    @objc dynamic var hours: Int = 0
    @objc dynamic var mins: Int = 0
    @objc dynamic var id: String = ""
    var time: Date{
        
        get{
            var components = DateComponents()
            components.hour = self.hours
            components.minute = self.mins
            let currentComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: Date())
            components.day = currentComponents.day!
            components.month = currentComponents.month!
            components.year = currentComponents.year!
            let tempDate = Calendar.current.date(from: components)!
            
            if isToday(){
                print("today")
                return tempDate
            }else{
                print("tomorrow")
                return Calendar.current.date(byAdding: .day, value: 1, to: tempDate)!
            }
        }
    }
    var dateComponents: DateComponents{
        get{
           var components = DateComponents()
            components.hour = hours
            components.minute = mins
            return components
        }
    }
    
    func set(message: String, am: Bool, hours: Int, mins: Int){
        self.message = message
        self.am = am
        self.hours = hours
        self.mins = mins
        self.id = UUID().uuidString
    }
    
  
    
    func isToday()->Bool{
        let currentComponents = Calendar.current.dateComponents([.hour, .minute], from: Date())
        let currentHour = currentComponents.hour ?? 0
        let currentMinute = currentComponents.minute ?? 0
        if self.hours > currentHour{
            return true
        }else if self.hours == currentHour{
            return self.mins > currentMinute
        }
        else{
            return false
        }
    }
    
    func updateAlarmState(state: Bool){
        let realm = try! Realm()
        try! realm.write() {
            self.on = state
        }
    }
    
    
    
}
