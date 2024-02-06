//
//  DatesScreenView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/3/24.
//

import SwiftUI
import Lottie

struct DatesScreenView: View {
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    @State private var isStartDatePresented = false
    @State private var isEndDatePresented = false
    
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
                LottieView(url: URL(string: ProcessInfo.processInfo.environment["DateLottie"]!)!)
                    .frame(maxWidth: 400, maxHeight: 200)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Spacer()
                HStack {
                    VStack {
                        Text("Lease Begin Date")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            
                        Button(action: {
                            print("Tapped lease START date")
                            isStartDatePresented.toggle()
                        }) {
                            VStack{
                                Image(systemName: "calendar.circle.fill")
                                    .font(.system(size: 50))
                                    .padding()
                                Text("\(formattedDate(startDate))")
                                    .padding(10)
                            }
                            .background(Color.white)
                            .foregroundColor(.purpleButton)
                            .fontWeight(.bold)
                            .clipShape(.rect(cornerRadius: 10))
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .sheet(isPresented: $isStartDatePresented) {
                                VStack {
                                    DatePicker("", selection: $startDate, displayedComponents: .date)
                                        .labelsHidden()
                                        .datePickerStyle(WheelDatePickerStyle())
                                        .padding()

                                    Button("Done") {
                                        isStartDatePresented.toggle()
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                    .padding()
                    
                    VStack {
                        Text("Lease End Date")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            
                        Button(action: {
                            print("Tapped lease END date")
                            isEndDatePresented.toggle()
                        }) {
                            VStack{
                                Image(systemName: "calendar.circle.fill")
                                    .font(.system(size: 50))
                                    .padding()
                                Text("\(formattedDate(endDate))")
                                    .padding(10)
                            }
                            .background(Color.white)
                            .foregroundColor(.purpleButton)
                            .fontWeight(.bold)
                            .clipShape(.rect(cornerRadius: 10))
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .sheet(isPresented: $isEndDatePresented) {
                                VStack {
                                    DatePicker("", selection: $endDate, displayedComponents: .date)
                                        .labelsHidden()
                                        .datePickerStyle(WheelDatePickerStyle())
                                        .padding()

                                    Button("Done") {
                                        isEndDatePresented.toggle()
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                    .padding()
                }
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        guard endDate > startDate else {
                            showAlert = true
                            return
                        }
                        
                        lease.setStartDate(start: startDate)
                        lease.setEndDate(end: endDate)
                        lease.printDates()
                        
                        coordinator.push(.mileageScreen)
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
            Alert(title: Text("Error"), message: Text("Start date must be before end date"), dismissButton: .default(Text("OK")))
        }
    }
}

//#Preview {
//    DatesScreenView()
//}
//#Preview {
//    DatesScreenView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//}
