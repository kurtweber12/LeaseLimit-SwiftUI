//
//  OverageScreenView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/3/24.
//

import SwiftUI
import Lottie

struct OverageScreenView: View {
    @State var overageFee = ""
    @State private var showAlert: Bool = false
    
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
                Spacer()
                LottieView(url: URL(string: ProcessInfo.processInfo.environment["OverageLottie"]!)!)
                    .frame(maxWidth: 400, maxHeight: 200)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Spacer()
                HStack {
                    Text("What is your overage cost ($) \nper mile? ")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.leading, 35)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                TextField("", text: $overageFee, prompt: Text("Enter cost in USD").foregroundColor(.purpleButton))
                    .keyboardType(.decimalPad)
                    .padding()
                    .foregroundColor(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.textBoxes)
                    )
                    .padding()
                Spacer()
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        guard !overageFee.isEmpty else {
                            showAlert = true
                            return
                        }
                        
                        lease.overageFee(overage: overageFee)
                        lease.updateUserDefaults(status: true)
                        coordinator.popToRoot()
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color("PurpleButton"))
                                .frame(maxWidth: 120, maxHeight: 44)
                                .shadow(radius: 5)
                            
                            Text("Finish →")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .font(.title3)
                        }
                    }
                }
                .padding(30)
            }
            
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Overage fee must be numeric and not empty"), dismissButton: .default(Text("OK")))
        }
    }
}

//
//#Preview {
//    OverageScreenView()
//}
//#Preview {
//    OverageScreenView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//}
