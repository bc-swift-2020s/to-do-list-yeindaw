//
//  LocalNotificationManager.swift
//  ToDoList
//
//  Created by Dawin Ye on 3/9/20.
//  Copyright © 2020 Dawin Ye. All rights reserved.
//

import UIKit
import UserNotifications

struct LocalNotificationManager {
    static func autherizeLocalNotifications(viewController: UIViewController){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { (granted, error) in
            guard error == nil else {
                print("error: \(error!.localizedDescription)")
                return
            }
            if granted {
                print("notification authorization granted")
            } else {
                print("notifications not authorized")
                //Put an alert in here telling the user what to do
                DispatchQueue.main.async {
                    viewController.oneButtonAlert(title: "Notifications Not Allowed", message: "Change that in the settings app")
                }
                
            }
        }
    }
    
    static func isAuthorized(completed: @escaping (Bool)->()){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { (granted, error) in
            guard error == nil else {
                print("error: \(error!.localizedDescription)")
                completed(false)
                return
            }
            if granted {
                print("notification authorization granted")
                completed(true)
            } else {
                print("notifications not authorized")
                //Put an alert in here telling the user what to do
                completed(false)
                }
                
            }
        }
    static func setCalendarNotification(title: String, subtitle: String, body: String, badgeNumber: NSNumber?, sound: UNNotificationSound?, date: Date) -> String {
        // create content:
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.sound = sound
        content.badge = badgeNumber
        
        // create trigger
        var dateComponents = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute], from: date)
        dateComponents.second = 00
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // create request
        let notificationID = UUID().uuidString
        let request = UNNotificationRequest(identifier: notificationID, content: content, trigger: trigger)
        
        // register request with the notification center
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Error: \(error.localizedDescription) Yikes, adding notification request went wrong")
            } else {
                print("Notification scheduled \(notificationID), title: \(content.title)")
            }
        }
        return notificationID
    }
}

