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
    
    @Published var friends = Friend.test
    
    @Published var friendNotificationScheduleTimeStart = Date()
    
    @Published var friendNotificationScheduleTimeEnd = Date()
    
    @Published var friendNotificationScheduleDates:  Set<DateComponents> = []
    
    @AppStorage("alertsOn") var alertsOn = true
    
    @AppStorage("agreeToTerms") var agreeToTerms = false
    
    init(selectedTypes: [HealthType]) {
        super.init(selectedTypes: selectedTypes)
        self.selectedTypes = selectedTypes
        if !agreeToTerms {
            navPath.append(Route.terms)
        }
    }
}
