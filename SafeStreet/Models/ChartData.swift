//
//  ChartData.swift
//  SafeStreet
//
//  Created by Andreas Ink on 11/5/22.
//

import SwiftUI

struct ChartData: Identifiable, Hashable {
    let id = UUID()
    var data = Double.random(in: 0...5)
    var date = Date().addingTimeInterval(60 * 60 * Double.random(in: 1...5))
    var title = ["Test", "Testing"].randomElement() ?? "Test"
}

extension ChartData {
    static let test = [
    ChartData(),
    ChartData(),
    ChartData(),
    ChartData(),
    ChartData(),
    ChartData()
    ]
}
