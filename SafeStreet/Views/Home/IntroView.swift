//
//  IntroView.swift
//  SafeStreet
//
//  Created by Andreas Ink on 11/5/22.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        VStack(spacing: 8) {
            SFSymbol.car
                .font(.system(size: 200))
                .aspectRatio(1/1, contentMode: .fit)
                .foregroundStyle(Gradient.split)
            Text("SAFE STREET")
                .font(.system(size: 50, design: .rounded))
            ProgressView()
                .progressViewStyle(.circular)
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
