//
//  ViewModel.swift
//  SafeStreet
//
//  Created by Andreas Ink on 11/5/22.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var navPath = NavigationPath()
    
    @Published var friends = Friend.test
    
    @Published var friendNotificationScheduleTimeStart = Date()
    
    @Published var friendNotificationScheduleTimeEnd = Date()
    
    @Published var friendNotificationScheduleDates:  Set<DateComponents> = []
    
    @AppStorage("alertsOn") var alertsOn = true
    
    @AppStorage("agreeToTerms") var agreeToTerms = false
    
    init() {
        if !agreeToTerms {
            navPath.append(Route.terms)
        }
    }
}
