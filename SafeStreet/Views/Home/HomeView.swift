//
//  HomeView.swift
//  SafeStreet
//
//  Created by Andreas Ink on 11/5/22.
//

import SwiftUI
import Charts
import HealthKit
import VitoKitCore

struct HomeView: View {
    let chartData: [HealthData]
    var body: some View {
        ScrollView {
            VStack {
                ForEach(Array(HKQuantityTypeIdentifier.Mobility), id: \.self) { type in
                    var filteredToType = chartData.filter {$0.title == type.type.rawValue }
                    let last = filteredToType.popLast()?.data ?? 0
                    let secondToLast = filteredToType.popLast()?.data ?? 0
                    StatRow(type: type.type, precent: ViewModel.percentageDifference(num1: secondToLast, num2: last))
                    Chart(filteredToType) { data in
                        LineMark(x: .value("", data.date),
                                 y: .value("", data.data))
                        .foregroundStyle(by: .value("", HKQuantityTypeIdentifier(rawValue: data.title).normalized))
                    }
                    .padding(.all)
                    
                }
            }
        }
        .navigationBarTitle("Home")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem {
                NavigationLink {
                    SettingsView()
                } label: {
                    SFSymbol.settings
                        .foregroundStyle(Color.foreground)
                        .font(.headline)
                }

            }
        }
            .navigationBarBackButtonHidden()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(chartData: [])
    }
}
