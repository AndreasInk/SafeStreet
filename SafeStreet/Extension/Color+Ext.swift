//
//  Color+Ext.swift
//  SafeStreet
//
//  Created by Andreas Ink on 11/5/22.
//

import SwiftUI

extension Color {
    
    static let background = Color("background")
    static let foreground = Color("foreground")
    static let white = Color("white")
    
}
extension Gradient {
    
    static let fade = LinearGradient(colors: [Color.white, Color.white.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing)
    static let split = AngularGradient(gradient: Gradient(colors: [.blue, .purple, .mint]), center: .center)
    static let split2 = AngularGradient(gradient: Gradient(colors: [.red, .purple, .orange]), center: .center)
    static let split3 = AngularGradient(gradient: Gradient(colors: [.blue, .teal, .mint]), center: .center)
    
    static let random = [split, split2, split3].randomElement() ?? split
    
}
