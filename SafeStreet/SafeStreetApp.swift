//
//  SafeStreetApp.swift
//  SafeStreet
//
//  Created by Andreas Ink on 11/5/22.
//

import SwiftUI

@main
struct SafeStreetApp: App {
    @StateObject var vm = ViewModel(selectedTypes: [.Mobility])
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $vm.navPath) {
                ContentView()
                    .onOpenURL { url in
                        
                    }
            }
            .environmentObject(vm)
        }
    }
}
