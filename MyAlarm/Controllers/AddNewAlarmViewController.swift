//
//  AddNewAlarmViewController.swift
//  MyAlarm
//
//  Created by Yehia Samak on 12/10/19.
//  Copyright © 2019 Yehia Samak. All rights reserved.
//

import UIKit

class AddNewAlarmViewController: UIViewController {

    @IBOutlet weak var hoursTextField: UITextField!
    @IBOutlet weak var minutesTextField: UITextField!
    @IBOutlet weak var amButtton: UIButton!
    @IBOutlet weak var pmButton: UIButton!
    @IBOutlet weak var addAlarmButton: UIButton!
    @IBOutlet weak var messageTextField: UITextField!
    
    var am: Bool = true
    var addingDelegate: AlarmAddingProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingUpUI()

    }
    
    func settingUpUI(){
        hoursTextField.roundDesign()
        minutesTextField.roundDesign()
        addAlarmButton.roundButtonDesign()
    }
    
    @IBAction func amButtonPressed(_ sender: UIButton) {
        am = true
        amButtton.setTitleColor(UIColor(rgb: 0xB03B46), for: .normal)
        pmButton.setTitleColor(UIColor(rgb: 0xB5B5B5), for: .normal)
    }
    
    @IBAction func pmButtonPressed(_ sender: UIButton) {
        am = false
        pmButton.setTitleColor(UIColor(rgb: 0xB03B46), for: .normal)
        amButtton.setTitleColor(UIColor(rgb: 0xB5B5B5), for: .normal)
    }
    
    @IBAction func addAlarmButtonPressed(_ sender: UIButton) {
        if(validTimeInput()){
            let alarm = createAlarm()
            makeNotification(alarm: alarm)
            addingDelegate?.addingAlarmToTheTable(alarm: alarm)
            self.dismiss(animated: true, completion: nil)
        }else{
            presenetAlert()
        }
    }
    
    func validTimeInput()-> Bool{
        guard let hoursString = hoursTextField.text else { return false }
        guard let minutesString = minutesTextField.text else { return false }
        guard let hours = Int(hoursString) else { return false }
        guard let minutes = Int(minutesString) else { return false }
        return hours >= 0 && hours <= 12 && minutes >= 0 &&  minutes <= 60
    }
    
    func createAlarm() -> Alarm{
        var hours: Int = Int(hoursTextField.text!)!
        let minutes: Int = Int(minutesTextField.text!)!
        hours += (am) ? 0 : 12
        let alarm = Alarm()
         alarm.set(message: messageTextField.text
            ?? "", am: am, hours: hours, mins: minutes)
        DatabaseManger.saveAlarm(alarm)
        return alarm
    }
    
    func presenetAlert(){
        let alert = UIAlertController(title: "Invalid Alarm", message: "please enter valid time ", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "back", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func makeNotification(alarm: Alarm){
        NotificationManger.shared.requestPermission()
        NotificationManger.shared.addNotification(alarm: alarm)
        NotificationManger.shared.scheduleNotifications()
    }
    
    
}
