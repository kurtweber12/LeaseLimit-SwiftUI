//
//  StartScreenView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 12/27/23.
//

import SwiftUI
import Lottie

// purple color is #5D3587

struct LeaseMileageScreenView: View {
    @State private var leaseMileage = ""
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
                ZStack {
                    VStack {
                        Text("Let's Get Started!")
                            .foregroundColor(.white)
                            //.font(.largeTitle)
                            .font(Font.custom("Baloo2-Bold", size: 32))
                            //.bold()
                            .offset(x: 0, y: -100)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }

                    AdaptiveView{
                        LottieView(url: URL(string: ProcessInfo.processInfo.environment["LeaseMileageLottieLight"]!)!)
                            .frame(maxWidth: 400, maxHeight: 300)
                            .shadow(color: .white, radius: 50)
                        
                    } dark: {
                        LottieView(url: URL(string: ProcessInfo.processInfo.environment["LeaseMileageLottieDark"]!)!)
                            .frame(maxWidth: 400, maxHeight: 300)
                    }
                }
                VStack {
                    HStack {
                        Text("What is your total allowed \nmileage?")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.leading, 35)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        
                        Spacer()
                    }
                    TextField("", text: $leaseMileage, prompt: Text("Enter mileage").foregroundColor(.purpleButton))
                        .keyboardType(.numberPad)
                        .padding()
                        .foregroundColor(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.textBoxes)
                        )
                        .padding()
                   
                }
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        guard !leaseMileage.isEmpty else {
                            showAlert = true
                            return
                        }
                        lease.setYearlyMileage(yearlyMiles: leaseMileage)
                        lease.printLease()
                        
                        coordinator.push(.datesScreen)
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
//                .padding(.trailing, 50)
//                .padding(.bottom, 10)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Mileage input cannot be empty or non-numeric"), dismissButton: .default(Text("OK")))
        }
    }
    
       
}




//#Preview {
//    LeaseMileageScreenView()
//}
//#Preview {
//    LeaseMileageScreenView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//}
