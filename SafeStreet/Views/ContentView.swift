//
//  ContentView.swift
//  SafeStreet
//
//  Created by Andreas Ink on 11/5/22.
//

import SwiftUI
import VitoKitCore
import HealthKit

struct ContentView: View {
    @EnvironmentObject var vm: ViewModel
    var body: some View {
       
            IntroView()
                .onAppear {
                    Task(priority: .userInitiated) {
                        
                        if vm.agreeToTerms {
                            try await getMobilityData()
                            try await Task.sleep(nanoseconds: UInt64.second)
                            vm.navPath.append(Route.home)
                            
                        }
                    }
                }
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .home:
                        HomeView(chartData: vm.healthData)
                    case .onboarding:
                        OnboardingView()
                    case .terms:
                        TermsView(pushedFromSettings: false)
                default:
                    EmptyView()
                }
            }
            
        
      
        
    }
    func getMobilityData() async throws {
        try await vm.authorize(selectedTypes: [.Mobility])
        for type in HKQuantityTypeIdentifier.Mobility {
            await vm.outliers(for: type, unit: type.unit, with: Date().addingTimeInterval(.month), to: Date())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
