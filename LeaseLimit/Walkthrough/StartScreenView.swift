//
//  StartScreenView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/10/24.
//

import SwiftUI
import SwiftData

struct StartScreenView: View {
    @Environment(NavigationCoordinator.self) var coordinator: NavigationCoordinator
    @Environment(LeaseViewModel.self) var lease: LeaseViewModel
    
    var body: some View {
        ZStack {
            AdaptiveView {
                Image("Start Screen Background - Light Mode")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            } dark: {
                Image("Start Screen Background - Dark Mode")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            }
            
            VStack {
                Image("LeaseLimitLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(30)
                Text("The best way to track your lease mileage.")
                    .padding(35)
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Spacer()
                HStack{
                    Spacer()
                     
                    Button(action: {
//                        coordinator.push(.dummy)
                        coordinator.push(.leaseMileageScreen)
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color("PurpleButton"))
                                .frame(maxWidth: 170, maxHeight: 44)
                                .shadow(radius: 5)
                            
                            Text("Get Started →")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .font(.title3)
                        }
                    }
                }
                .padding(30)
            }
        }
        
    }
}

//#Preview {
//    StartScreenView()
//}
//#Preview {
//    StartScreenView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//}
