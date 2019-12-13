//
//  AlarmListDataSource.swift
//  MyAlarm
//
//  Created by Yehia Samak on 12/10/19.
//  Copyright © 2019 Yehia Samak. All rights reserved.
//

import UIKit

class AlarmListDataSource: NSObject, UITableViewDataSource{
    var alarms : [Alarm]
    
    init(arr: [Alarm]) {
           self.alarms = arr
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let alarm: Alarm = alarms[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell") as! AlarmTableViewCell
        cell.setAlarm(for: alarm)
        return cell
    }
    
    
}
