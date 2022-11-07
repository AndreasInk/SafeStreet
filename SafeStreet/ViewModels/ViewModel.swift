//
//  ViewModel.swift
//  SafeStreet
//
//  Created by Andreas Ink on 11/5/22.
//

import SwiftUI
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
    
}
