//
//  DesignateAFriendView.swift
//  SafeStreet
//
//  Created by Andreas Ink on 11/6/22.
//

import SwiftUI

struct DesignateAFriendView: View {
    @EnvironmentObject var vm: ViewModel
   
    var body: some View {
        VStack(spacing: 8) {
            SFSymbol.smile
                .font(.system(size: 100))
                .foregroundStyle(Gradient.split)
                .padding(.all)
            VStack(spacing: 4) {
                Text("Add a new friend?")
                    .font(.system(.title, design: .rounded)).bold()
                Text("Your new friend can act as a designated accountability buddy")
                    .multilineTextAlignment(.center)
                    .font(.system(.subheadline, design: .rounded))
                    .padding(.horizontal, 24)
                    .opacity(0.6)
                    
            }
            .padding(.horizontal)
            .fixedSize(horizontal: false, vertical: true)
            VStack(spacing: 4) {
                ShareLink(item: "SafeStreet://" + vm.myCode) {
                    Text("Share Your Code")
                        .font(.system(.headline, design: .rounded))
                }
               
                
                TextField("Friend's Code", text: $vm.othersCode)
                    .font(.system(.subheadline, design: .rounded))
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.top, 38)
            .fixedSize(horizontal: false, vertical: true)
            Spacer()
        }
        .padding(.all)
    }
}

struct DesignateAFriendView_Previews: PreviewProvider {
    static var previews: some View {
        DesignateAFriendView()
            .environmentObject(ViewModel(selectedTypes: []))
    }
}
