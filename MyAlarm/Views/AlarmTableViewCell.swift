//
//  AlarmTableViewCell.swift
//  MyAlarm
//
//  Created by Yehia Samak on 12/5/19.
//  Copyright © 2019 Yehia Samak. All rights reserved.
//

import UIKit
import SwipeCellKit

class AlarmTableViewCell: UITableViewCell {
    
    @IBOutlet weak var amOrPmLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var onOrOffSwitch: UISwitch!
    @IBOutlet weak var alarmTypeLabel: UILabel!
    
    var alarm: Alarm?
    
    
    // Initialization code
    override func awakeFromNib() {
        super.awakeFromNib()
        onOrOffSwitch.addTarget(self, action: #selector(stateChanged), for: .valueChanged)
    }
    
     // Configure the view for the selected state
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setAlarm(for alarm: Alarm){
        self.alarm = alarm
        amOrPmLabel.text = (alarm.am) ? "AM" : "PM"
        onOrOffSwitch.isOn = alarm.on
        var hours = alarm.hours
        hours -= (alarm.am) ? 0  : 12
        timeLabel.text = formateNumber(number: hours) + ":" + formateNumber(number: alarm.mins)
    }
    
    @objc func stateChanged(switchState: UISwitch) {
        showOrDimLabel(show: switchState.isOn)
        alarm?.updateAlarmState(state: switchState.isOn)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        onOrOffSwitch.isOn = alarm!.on
        showOrDimLabel(show: onOrOffSwitch.isOn)
        
    }
    
    func showOrDimLabel(show: Bool){
        let colorHexValue = (show) ? 0x444444 : 0xC7C7C7
        timeLabel.textColor = UIColor(rgb: colorHexValue)
        alarmTypeLabel.textColor = UIColor(rgb: colorHexValue)
    }
 
    func formateNumber(number: Int)->String{
        if number / 10 == 0{
            return "0" + String(number)
        }else{
            return String(number)
        }
    }
}


