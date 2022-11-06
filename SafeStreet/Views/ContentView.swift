//
//  ContentView.swift
//  SafeStreet
//
//  Created by Andreas Ink on 11/5/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        NavigationStack(path: $vm.navPath) {
            IntroView()
                .onAppear {
                    Task(priority: .userInitiated) {
                        try await Task.sleep(nanoseconds: UInt64.second)
                        if vm.agreeToTerms {
                            vm.navPath.append(Route.home)
                        }
                    }
                }
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .home:
                        HomeView(chartData: ChartData.test)
                    case .terms:
                        TermsView(pushedFromSettings: false)
                default:
                    EmptyView()
                }
            }
            
        }
        .environmentObject(vm)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
