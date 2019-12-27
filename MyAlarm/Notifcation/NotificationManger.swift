//
//  NotificationManger.swift
//  MyAlarm
//
//  Created by Yehia Samak on 12/11/19.
//  Copyright © 2019 Yehia Samak. All rights reserved.
//

import Foundation
import UserNotifications




class NotificationManger{
    var alarms: [Alarm]
    static let shared = NotificationManger()
    
    private init(){
        alarms = [Alarm]()
    }
    
    func requestPermission() -> Void {
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: [.alert, .badge, .alert]) { granted, error in
                if granted == true && error == nil {
                    // We have permission!
                }
        }
    }
    
    func addNotification(alarm: Alarm) -> Void {
        alarms.append(alarm)
    }
    
    func scheduleNotifications() -> Void {
        for alarm in alarms {
            let content = UNMutableNotificationContent()
            content.title = "Alarm"
            content.body = alarm.message
//            content.sound = UNNotificationSound(named: UNNotificationSoundName("soundy.m4a"))
            content.sound = UNNotificationSound.default
            
            //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: Date().distance(to: alarm.time),  repeats: false)
            let trigger = UNCalendarNotificationTrigger(dateMatching: alarm.dateComponents,  repeats: false)
            let request = UNNotificationRequest(identifier: alarm.id, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                guard error == nil else { return }
                print("Scheduling notification with id")
           }
           }
    }
}
