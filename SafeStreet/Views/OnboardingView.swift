//
//  OnboardingView.swift
//  SafeStreet
//
//  Created by Andreas Ink on 11/6/22.
//

import SwiftUI

struct OnboardingView: View {
    @State var currentOnboarding = Onboarding.onbooarding.first!
    var body: some View {
        TabView(selection: $currentOnboarding) {
            ForEach(Onboarding.onbooarding) { onboarding in
                ZStack {
                    VStack {
                        Spacer()
                        Text(onboarding.title)
                            .font(.system(.title, design: .rounded)).bold()
                        Text(onboarding.text)
                            .font(.system(.subheadline, design: .rounded))
                            .padding(.horizontal)
                            .padding(.top)
                    }
                    .padding(.all)
                    .padding(.bottom)
                        
                    
                    VStack {
                        switch onboarding.scene {
                        default:
                            EmptyView()
                        }
                        Spacer()
                    }
                }
            }
            
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
