//
//  ContentViewOld.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/4/24.
//

import SwiftUI
import SwiftData

// Model: Data
// Container: Where things are saved
// Context: How you interact

struct ContentViewOld: View {
    @Environment(\.modelContext) var context
    @State private var currentMileage = ""
    @State private var allowedMileage = ""
    @State private var selectedDate = Date()
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var isSheetPresented = false
    @State private var isStartDatePresented = false
    @State private var isEndDatePresented = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Current Mileage")
                    Spacer()
                    TextField("", text: $currentMileage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .padding()
                        .frame(width: 200)
                      
                }
                HStack {
                    Text("Allowed Mileage")
                    Spacer()
                    TextField("", text: $allowedMileage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .padding()
                        .frame(width: 200)
                      
                }
                
    //            HStack {
    //                Text("Current Date")
    //                Spacer()
    //                TextField("", text: $currentMileage)
    //                    .textFieldStyle(RoundedBorderTextFieldStyle())
    //                    .keyboardType(.numberPad)
    //                    .padding()
    //                    .frame(width: 200)
    //
    //            }
    //
    //            HStack {
    //                Text("End Date")
    //                Spacer()
    //                TextField("", text: $currentMileage)
    //                    .textFieldStyle(RoundedBorderTextFieldStyle())
    //                    .keyboardType(.numberPad)
    //                    .padding()
    //                    .frame(width: 200)
    //
    //            }
                
                VStack {
                    Text("Current Date")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .underline()
                        .padding(4)
                    HStack {
                        Text("\(formattedDate(selectedDate))")
                        Spacer()
                        Button("Select Current Date") {
                            isSheetPresented.toggle()
                        }
                        
                        .sheet(isPresented: $isSheetPresented) {
                            VStack {
                                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                                    .labelsHidden()
                                    .datePickerStyle(WheelDatePickerStyle())
                                    .padding()

                                Button("Done") {
                                    isSheetPresented.toggle()
                                }
                                .padding()
                            }
                        }
                    }
                }
                
                VStack {
                    Text("Start Date")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .underline()
                        .padding(4)
                    HStack {
                        Text("\(formattedDate(startDate))")
                        Spacer()
                        Button("Select Start Date") {
                            isStartDatePresented.toggle()
                        }
                        
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
                
                VStack {
                    HStack {
                        Spacer()
                        Text("End Date")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .underline()
                            .padding(.vertical, 4)
                        Spacer()
                        
                    }
                    
                
                    HStack {
                        Text("\(formattedDate(endDate))")
                        Spacer()
                        Button("Select End Date") {
                            isEndDatePresented.toggle()
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(14)
                        
                        
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
                    .padding()
                    
                }
                .background(Color(UIColor.lightGray))
                .cornerRadius(14)
                
                
                NavigationView {
                            VStack {
                                Text("Home Screen")
                                    .font(.largeTitle)

                                NavigationLink(destination: StartScreenView()) {
                                    Text("Go to Start Screen")
                                        .foregroundColor(.blue)
                                        .padding()
                                        .background(Color.gray)
                                        .cornerRadius(10)
                                }
                            }
                            .navigationTitle("Navigation Example")
                        }
                .navigationBarBackButtonHidden(true)
                
                HStack {
                    Button("Save") {
                        guard !currentMileage.isEmpty else {
                            return
                        }
                        
                        
                        //let newMileage = LeaseModel(currentDate: <#T##Date#>, endDate: <#T##Date#>, mileageLimit: <#T##Int#>, monthlyMileage: <#T##Double#>, dailyMileage: <#T##Double#>, currentMileage: <#T##Int#>)
                        
                        //context.insert(newMileage)
                        
                        currentMileage = ""
                    }
                }
            }
            .padding()
            
            
    //        NavigationView {
    //                    List {
    //                        ForEach(1..<10) { index in
    //                            // Each row contains an HStack with two elements and a Spacer between them
    //                            HStack {
    //                                Text("Element 1")
    //                                Spacer()
    //                                Text("Element 2")
    //                            }
    //                        }
    //                    }
    //                    .navigationBarTitle("Your Lease Information")
    //                }
            
            Spacer()
            
        }
        
        
    }
    
    private func formattedDate(_ date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            return formatter.string(from: date)
        }
}

#Preview {
    ContentViewOld()
}
