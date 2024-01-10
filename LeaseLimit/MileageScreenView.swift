//
//  MileageScreenView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/3/24.
//

import SwiftUI
import Lottie

//https://lottie.host/82efb605-e531-4584-995f-e016ad17c3a1/YpLPsvUAdz.json
//https://lottie.host/4155e67f-4f76-4a7f-b83e-bb7eeda22a6f/b5qxJTTp1a.json
struct MileageScreenView: View {
    @State var currentMileage = ""
    @State var startMileage = ""
    
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
                Spacer()
                LottieView(url: URL(string: "https://lottie.host/4155e67f-4f76-4a7f-b83e-bb7eeda22a6f/b5qxJTTp1a.json")!)
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
                                .fill(Color.textBoxes) // Set the background color to white
                            
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
                                .fill(Color.textBoxes) // Set the background color to white
                            
                        )
                        .padding()
                }
                Spacer()
                Spacer()
                HStack{
                    Spacer()
                    NavigationLink(destination: HomeScreenView()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color("PurpleButton"))
                                .frame(maxWidth: 120, maxHeight: 44) // Adjust height as needed
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
    }
}

#Preview {
    MileageScreenView()
}
#Preview {
    MileageScreenView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
