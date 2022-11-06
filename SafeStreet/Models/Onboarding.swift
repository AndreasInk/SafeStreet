//
//  Onboarding.swift
//  SafeStreet
//
//  Created by Andreas Ink on 11/6/22.
//

import SwiftUI

struct Onboarding: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let text: String
    let scene: OnboardingScene
}
enum OnboardingScene {
    case Bar     // Bar scene where we meet a guy
    case BarMore // Guy gets too drunk
    case Car     // Guy walks to car
    case Alert   // Alert notifies him and a friend that he may be under the influence
    case Friend  // Friend calls him to check in
}

extension Onboarding {
    static let onbooarding = [
        Onboarding(title: "Reduce DUIs with accountability and tech", text: "Drinking and driving is bad (expand on this lol) ", scene: .Bar),
        Onboarding(title: "", text: "", scene: .BarMore),
        Onboarding(title: "", text: "", scene: .Car),
        Onboarding(title: "", text: "", scene: .Alert),
        Onboarding(title: "", text: "", scene: .Friend)
    ]
}
