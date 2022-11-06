//
//  HKQuanity+Ext.swift
//  SafeStreet
//
//  Created by Andreas Ink on 11/5/22.
//

import SwiftUI
import HealthKit

extension HKQuantityTypeIdentifier {
    var normalized: String {
        var sol = ""
        for char in self.rawValue.replacingOccurrences(of: "HKQuantityTypeIdentifier", with: "") {
            if char.isUppercase {
                sol.append(" ")
                sol.append(char)
            } else {
                sol.append(char)
            }
        }
        return sol
    }
}
