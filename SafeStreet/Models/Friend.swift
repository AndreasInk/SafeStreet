//
//  Friend.swift
//  SafeStreet
//
//  Created by Andreas Ink on 11/5/22.
//

import SwiftUI

struct Friend: Identifiable, Hashable {
    var id: String
    var firstName: String
    var isListeningForAlerts = true
}

extension Friend {
    static let test = [
        Friend(id: UUID().uuidString, firstName: "Josh"),
        Friend(id: UUID().uuidString, firstName: "Joe"),
        Friend(id: UUID().uuidString, firstName: "John")
    ]
}
