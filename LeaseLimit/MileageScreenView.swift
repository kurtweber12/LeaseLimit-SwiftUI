//
//  MileageScreenView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/3/24.
//

import SwiftUI

struct MileageScreenView: View {
    var body: some View {
        ZStack {
            AdaptiveView {
                Image("Start Screen Background - Light Mode") // Replace with the name of your vector image asset
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    
            } dark: {
                Image("Start Screen Background - Dark Mode") // Replace with the name of your vector image asset
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                   
            }
            
            VStack {
                Text("Let's Get Started!")
                    .foregroundColor(.white)
                    .bold()
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    MileageScreenView()
}
#Preview {
    MileageScreenView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
