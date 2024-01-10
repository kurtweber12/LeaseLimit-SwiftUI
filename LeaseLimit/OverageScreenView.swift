//
//  OverageScreenView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/3/24.
//

import SwiftUI
import Lottie

//https://lottie.host/bc1f9fa5-1af9-43e7-8026-4a79b2609ac3/ACfNc6thTE.json

struct OverageScreenView: View {
    @State var overageFee = ""
    
    
    
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
                LottieView(url: URL(string: "https://lottie.host/bc1f9fa5-1af9-43e7-8026-4a79b2609ac3/ACfNc6thTE.json")!)
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
                            .fill(Color.textBoxes) // Set the background color to white
                            
                    )
                    .padding()
                Spacer()
                Spacer()
                HStack{
                    Spacer()
                    NavigationLink(destination: MileageScreenView()) {
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
    OverageScreenView()
}
#Preview {
    OverageScreenView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
