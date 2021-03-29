//
//  UserNotifications.swift
//  Grains
//
//  Created by Алексей Чигарских on 20.03.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit
import UserNotifications

class UserNotifications: NSObject {
    static let shared = UserNotifications()

    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { success, error in
            if success {
                //
            } else {
                print(error?.localizedDescription ?? "error of authorization Notification")
            }
        }
    }

    func createNotification(timeInSeconds: Int, nameOfGrain: String) {
        let content = UNMutableNotificationContent()
        content.title = nameOfGrain
        // content.subtitle = "\(timeInSeconds.timeOfBoil) \(Model.shared.skloneniaMinut(boilTime: timeInSeconds))"
        content.body = "Ваше блюдо готово, приятного аппетита!".localize()
        content.sound = .default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(timeInSeconds), repeats: false)
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}

extension UserNotifications: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_: UNUserNotificationCenter, didReceive _: UNNotificationResponse, withCompletionHandler _: @escaping () -> Void) {
        print("Did receive Notification")
    }

    func userNotificationCenter(_: UNUserNotificationCenter, willPresent _: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert])
    }
}
