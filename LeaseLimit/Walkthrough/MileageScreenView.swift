//
//  MileageScreenView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/3/24.
//

import SwiftUI
import Lottie

struct MileageScreenView: View {
    @State var currentMileage = ""
    @State var startMileage = ""
    
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

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
                LottieView(url: URL(string: ProcessInfo.processInfo.environment["MileageLottie"]!)!)
                    .frame(maxWidth: 400, maxHeight: 300)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)

                VStack {
                    HStack {
                        Text("What is your current mileage?")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.leading, 35)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    TextField("", text: $currentMileage, prompt: Text("Enter current mileage").foregroundColor(.purpleButton))
                        .keyboardType(.decimalPad)
                        .padding()
                        .foregroundColor(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.textBoxes)
                        )
                        .padding()
                }
                .padding(.bottom, 30)
                VStack {
                    HStack {
                        Text("What was your start mileage?")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.leading, 35)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    TextField("", text: $startMileage, prompt: Text("Enter start mileage").foregroundColor(.purpleButton))
                        .keyboardType(.decimalPad)
                        .padding()
                        .foregroundColor(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.textBoxes)
                        )
                        .padding()
                }
                Spacer()
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        guard !currentMileage.isEmpty && !startMileage.isEmpty else {
                            alertMessage = "Start mileage and current mileage must be numeric and not empty"
                            showAlert = true
                            return
                        }
                        
                        guard currentMileage >= startMileage else {
                            alertMessage = "Start mileage cannot be more than current mileage"
                            showAlert = true
                            return
                        }
                        
                        lease.startMileage(startMiles: startMileage)
                        lease.currentMileage(currentMiles: currentMileage)
                        lease.printMileage()
                        coordinator.push(.overageScreen)
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color("PurpleButton"))
                                .frame(maxWidth: 120, maxHeight: 44)
                                .shadow(radius: 5)
                            
                            Text("Next →")
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
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
}

//#Preview {
//    MileageScreenView()
//}
//#Preview {
//    MileageScreenView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//}
