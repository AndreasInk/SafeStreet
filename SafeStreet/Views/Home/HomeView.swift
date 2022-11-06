//
//  HomeView.swift
//  SafeStreet
//
//  Created by Andreas Ink on 11/5/22.
//

import SwiftUI
import Charts
struct HomeView: View {
    let chartData: [ChartData]
    var body: some View {
        VStack {
            Chart(chartData) { data in
                BarMark(x: .value("", data.date),
                        y: .value("", data.data))
                .foregroundStyle(Color.purple)
            }
            .padding(.all)
            StatRow(type: .walkingAsymmetryPercentage, precent: 0.5)
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
        HomeView(chartData: ChartData.test)
    }
}
