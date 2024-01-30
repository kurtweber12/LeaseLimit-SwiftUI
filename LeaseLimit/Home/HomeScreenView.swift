//
//  MainScreenView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/9/24.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var currentDate = Date()
    @State private var currentMileage = ""
    @FocusState private var isMileageFocused: Bool
    
    
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
            
            VStack{
                VStack(spacing: 7) {
                    Text("Your Lease Information")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top, 30)
                   
                    VStack{
                        VStack(spacing: 11) {
                            HStack {
                                Text("Daily Mileage")
                                Spacer()
                                Text("123.4")
                            }
                            Divider()
                            HStack {
                                Text("Current Mileage")
                                Spacer()
                                Text("\(currentMileage)")
                            }
                            Divider()
                            HStack {
                                Text("Current Date")
                                Spacer()
                                Text("\(formattedDate(currentDate))")
                            }
                            Divider()
                            HStack {
                                Text("Start Date")
                                Spacer()
                                Text("\(formattedDate(currentDate))")
                            }
                            Divider()
                            HStack {
                                Text("End Date")
                                Spacer()
                                Text("\(formattedDate(currentDate))")
                            }
                            Divider()
                            HStack {
                                Text("Mileage Allowed")
                                Spacer()
                                Text("123.4")
                            }
                            Divider()
                            HStack {
                                Text("Miles Remaining")
                                Spacer()
                                Text("123.4")
                            }
                            
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                    }
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color(uiColor: .secondarySystemBackground))
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    )
                    .padding(20)
                    
                
                    VStack {
                        HStack{
                            Text("Update Mileage")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .underline()
                                .foregroundStyle(.white)
                            Spacer()
                        }
                        VStack {
                          
                            TextField("", text: $currentMileage, prompt: Text("")).focused($isMileageFocused)
                                    .keyboardType(.decimalPad)
                                    .padding()
                                    .foregroundColor(.black)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.textBoxes)
                                    )
                        }
                    }
                    .padding(20)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            print("Calculate Button Pressed")
                            isMileageFocused = false
                        }) {
                            HStack{
                                Text("Calculate")
                                    .padding()
                                    .fontWeight(.semibold)
                            }
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.purpleButton))
                            .foregroundStyle(Color.white)
                            
                            
                        }
                    }
                    
                    .padding(20)
                    
                    
//                    VStack{
//                        VStack(spacing: 11) {
//                            HStack {
//                                Text("Update Mileage")
//                                Spacer()
//                                HStack {
//                                    
//                                    TextField("", text: $currentMileage, prompt: Text(""))
//                                        .keyboardType(.decimalPad)
//                                        .padding(.horizontal)
//                                    
//                                }
//                                
//                            }
//                            Divider()
//                            HStack {
//                                Text("Current Date")
//                                Spacer()
//                                HStack{
//                                    Text("\(formattedDate(currentDate))")
//                                    Image(systemName: "chevron.forward")
//                                }
//                                
//                            }
//                        }
//                        .padding(.vertical, 12)
//                        .padding(.horizontal)
//                    }
//                    .background(RoundedRectangle(cornerRadius: 10)
//                        .fill(Color(uiColor: .secondarySystemBackground))
//                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//                    )
//                    .padding(20)
                    
                    Spacer()
                    
                    
                }
            }
        }
    }
}

#Preview {
    HomeScreenView()
}
#Preview {
    HomeScreenView().preferredColorScheme(.dark)
}
