//
//  ViewModel.swift
//  SafeStreet
//
//  Created by Andreas Ink on 11/5/22.
//

import SwiftUI
import Accelerate
import VitoKitCore

class ViewModel: Vito {
    
    @Published var navPath = NavigationPath()
    
    @UserDefault("friends", defaultValue: [Friend]()) var friends
    
    @Published var friendNotificationScheduleTimeStart = Date()
    
    @Published var friendNotificationScheduleTimeEnd = Date()
    
    @Published var friendNotificationScheduleDates:  Set<DateComponents> = []
    
    @AppStorage("alertsOn") var alertsOn = true
    
    @AppStorage("agreeToTerms") var agreeToTerms = false
    
    @AppStorage("myCode") var myCode = UUID().uuidString
    
    @AppStorage("othersCode") var othersCode = ""
    
    @AppStorage("name") var name = ""
    
    init(selectedTypes: [HealthType]) {
        super.init(selectedTypes: selectedTypes)
        self.selectedTypes = selectedTypes
        if !agreeToTerms {
            navPath.append(Route.terms)
        }
    }
    static func percentageDifference(num1: Double, num2: Double) -> Double {
        return (num2 - num1) / num1
    }
    func checkIfNotificationNeeded(_ data: [HealthData]) {
        let onlyPast3Hours = data.filter { data in
            return data.date > Date().addingTimeInterval(.hour * 3)
        }
        let averageRisk = vDSP.mean(onlyPast3Hours.map{Double($0.risk)})
        print(data.map{$0.risk})
        if averageRisk > 0.75 {
           let notifier = PushNotificationSender()
            for friend in friends {
                if friend.isListeningForAlerts {
                    //notifier.sendPushNotification(to: friend.id, title: "\(name)'s mobility has decreased ", body: "\(name) wanted to alert you of this change and to check in on them incase of intoxication")
                }
            }
        }
    }
}
