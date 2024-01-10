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
                
                    // Your content goes here
            VStack {
                ZStack {
                    VStack {
                        Text("Let's Get Started!")
                            .foregroundColor(.white)
                            //.font(.largeTitle)
                            .font(Font.custom("Baloo2-VariableFont_wght", size: 18))
                            .bold()
                            .offset(x: 0, y: -100)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                   
                    AdaptiveView{
                        LottieView(url: URL(string: "https://lottie.host/ba4e1f75-45f9-4f38-a21e-fc9fda2c4eba/OuSPeObGxb.json")!)
                            .frame(maxWidth: 400, maxHeight: 300)
                            .shadow(color: .white, radius: 50)
                    } dark: {
                        LottieView(url: URL(string: "https://lottie.host/9046c96a-5330-4385-9a4d-a9feb9b0f8bb/lsT9guz0Wf.json")!)
                            .frame(maxWidth: 400, maxHeight: 300)
                    }
                }
                VStack {
                    HStack {
                        Text("What is your yearly allowed \nmileage?")
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
                                .fill(Color.textBoxes) // Set the background color to white
                                
                        )
                        .padding()
                   
                }
                Spacer()
                HStack{
                    Spacer()
                    NavigationLink(destination: DatesScreenView()) {
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
//                HStack {
//                    Spacer()
//                    Button(action: {
//                                // Your button action
//                                print("Button tapped")
//                        
//                            }) {
//                                ZStack {
//                                    RoundedRectangle(cornerRadius: 5)
//                                        .fill(Color("PurpleButton"))
//                                        .frame(maxWidth: 120, maxHeight: 44) // Adjust height as needed
//                                        .shadow(radius: 5)
//                                    
//                                    Text("Next →")
//                                        .foregroundColor(.white)
//                                        .fontWeight(.semibold)
//                                        .font(.title3)
//                                }
//                            }
//                }
//                .padding(.trailing, 50)
//                .padding(.bottom, 10)
            }
        }
    }
    
       
}




#Preview {
    LeaseMileageScreenView()
}
#Preview {
    LeaseMileageScreenView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
