//
//  TermsView.swift
//  SafeStreet
//
//  Created by Andreas Ink on 11/5/22.
//

import SwiftUI

struct TermsView: View {
    @EnvironmentObject var vm: ViewModel
    var pushedFromSettings = false
    var body: some View {
        VStack {
            Text("LEGAL STUFF")
            Button {
                vm.agreeToTerms = true
                vm.navPath.append(Route.home)
            } label: {
                Text("AGREE")
            }
            
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .foregroundStyle(Gradient.split)
            .navigationBarBackButtonHidden(!pushedFromSettings)
        }

    }
}

struct TermsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsView()
            .environmentObject(ViewModel(selectedTypes: []))
    }
}
