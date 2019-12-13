//
//  ViewController.swift
//  MyAlarm
//
//  Created by Yehia Samak on 12/5/19.
//  Copyright © 2019 Yehia Samak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addAlarmButton: UIButton!
    @IBOutlet weak var scheduleButton: UIButton!
    @IBOutlet weak var meetingButton: UIButton!
    @IBOutlet weak var alarmsTableView: UITableView!
    
    var alarms: [Alarm] = [Alarm]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingUpUIElement()
        alarms = DatabaseManger.queryAllAlarms()
        alarmsTableView.delegate = self
        alarmsTableView.dataSource = self
        let noticationManger = NotificationManger()
        noticationManger.requestPermission()
    }
    
    func settingUpUIElement(){
        addAlarmButton.roundButtonDesign()
        scheduleButton.OneSideroundButtonDesign(left: true)
        meetingButton.OneSideroundButtonDesign(left: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        alarms = DatabaseManger.queryAllAlarms()
        alarmsTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addAlarmSegue"){
            let viewController = segue.destination as! AddNewAlarmViewController
            viewController.addingDelegate = self
        }
    }
    
    @IBAction func addAlramButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "addAlarmSegue", sender: self)
    }
    
}


extension ViewController: UITableViewDataSource{
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
    


extension ViewController: UITableViewDelegate{
        
}


extension ViewController: AlarmAddingProtocol {
    func addingAlarmToTheTable(alarm: Alarm) {
        alarms.append(alarm)
        alarmsTableView.reloadData()
    }
    
    
}

