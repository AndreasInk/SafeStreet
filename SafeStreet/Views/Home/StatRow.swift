//
//  StatRow.swift
//  SafeStreet
//
//  Created by Andreas Ink on 11/5/22.
//

import SwiftUI
import HealthKit

struct StatRow: View {
    let type: HKQuantityTypeIdentifier
    let precent: Double
    var body: some View {
        HStack {
            Group {
                if precent > 0  {
                    SFSymbol.arrowUp
                } else {
                    SFSymbol.arrowDown
                }
            }
            .foregroundStyle(Gradient.split)
            .font(.system(size: 65))
               
            Spacer()
            Text("\(type.normalized) \(precent > 0 ? "increasing" : "decreasing") by \((round(1000 * precent)/1000).formatted(.percent))")
                .font(.system(.caption, design: .rounded))
                .multilineTextAlignment(.trailing)
        }
        .fontWeight(.bold)
        .padding(.all)
    }
}

struct StatRow_Previews: PreviewProvider {
    static var previews: some View {
        StatRow(type: .walkingAsymmetryPercentage, precent: 0.5)
    }
}
