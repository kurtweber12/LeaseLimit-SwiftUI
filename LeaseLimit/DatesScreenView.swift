//
//  DatesScreenView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/3/24.
//

import SwiftUI

struct DatesScreenView: View {
    var body: some View {
        ZStack {
            AdaptiveView {
                Image("Start Screen Background - Light Mode") // Replace with the name of your vector image asset
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            } dark: {
                Image("Start Screen Background - Dark Mode") // Replace with the name of your vector image asset
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    DatesScreenView()
}
#Preview {
    DatesScreenView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
