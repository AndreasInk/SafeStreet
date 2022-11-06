//
//  SettingsView.swift
//  SafeStreet
//
//  Created by Andreas Ink on 11/5/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var vm: ViewModel
    @State var showMultiDates = false
    var body: some View {
        List {
            Section("Friends") {
                HStack {
                    ForEach(Array(zip(vm.friends, vm.friends.indices)), id: \.1) { friend, friendIndex in
                        Text(friend.firstName)
                            .strikethrough(friend.isListeningForAlerts)
                            .onTapGesture {
                                vm.friends[friendIndex].isListeningForAlerts.toggle()
                            }
                    }
                }
            NavigationLink {
                
            } label: {
                Text("Designate a new friend")
            }
               
        }
            Section("Notifications") {
                Toggle(isOn: $vm.alertsOn) {
                    Text("Friend Notifications \(vm.alertsOn ? "ON" : "OFF")")
                }
                VStack(alignment: .leading) {
                    Button("Notification Schedule Dates \(!showMultiDates ? ">" : "˅")") {
                        showMultiDates.toggle()
                    }
                    if showMultiDates {
                        MultiDatePicker("Notification Schedule Dates", selection: $vm.friendNotificationScheduleDates)
                    }
                }
                .padding(.vertical)
                HStack {
                    DatePicker("Start", selection: $vm.friendNotificationScheduleTimeStart, displayedComponents: .hourAndMinute)
                    
                    DatePicker("End", selection: $vm.friendNotificationScheduleTimeStart, displayedComponents: .hourAndMinute)
                }
                .font(.caption)
            }
            
            NavigationLink {
                TermsView(pushedFromSettings: true)
            } label: {
                Text("Legal")
            }
            

        }
        .navigationTitle(
            Text("Settings")
            .fontDesign(.monospaced)
            .fontWeight(.semibold)
        )
        .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.large)
        .fontDesign(.monospaced)
        .fontWeight(.semibold)
    }
}

struct SettingsView_Previews: PreviewProvider {

    static var previews: some View {
        SettingsView()
            .environmentObject(ViewModel())
    }
}
