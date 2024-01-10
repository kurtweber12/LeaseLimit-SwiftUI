//
//  MainScreenView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/9/24.
//

import SwiftUI

struct HomeScreenView: View {
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
                
            }
        }
    }
}

#Preview {
    HomeScreenView()
}
