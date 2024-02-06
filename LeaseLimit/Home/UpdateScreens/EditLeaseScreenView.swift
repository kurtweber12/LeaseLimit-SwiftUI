//
//  EditLeaseScreenView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/30/24.
//

import SwiftUI
import SwiftData

struct EditLeaseScreenView: View {
    @Environment(NavigationCoordinator.self) var coordinator: NavigationCoordinator
    //@Environment(LeaseViewModel.self) var lease: LeaseViewModel
    
    @Query var items: [LeaseModel]
    var editLease: LeaseModel? { items.first }
    
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var currentDate =  Date()
    
    @State private var isStartDatePresented = false
    @State private var isEndDatePresented = false
    @State private var isCurrentDatePresented = false
    
    @State private var startMileage: String = ""
    @State private var mileageLimit: String = ""
    @State private var currentMileage: String = ""
    
    @State private var overageFee: String = ""
    
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    
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
                Text("Edit Lease")
                    .foregroundStyle(Color.white)
                    .fontWeight(.semibold)
                    .font(.title3)
                    
                VStack {
                    // Start Date Begin
                    Button(action: {
                        print("start date")
                        isStartDatePresented.toggle()
                    }) {
                        HStack {
                            HStack {
                                VStack {
                                    HStack{
                                        Text("Start Date")
                                            .font(.subheadline)
                                            .foregroundStyle(Color.secondary)
                                        Spacer()
                                    }
                                    HStack {
                                        Text("\(formattedDate(startDate))")
                                            .foregroundStyle(Color.primary)
                                            .fontWeight(.semibold)
                                            .font(.title3)
                                        Spacer()
                                    }
                                }.padding(.vertical, 12)
                                
                                Spacer()
                                Image(systemName: "calendar")
                                    .font(.system(size: 16))
                                    .foregroundStyle(Color.secondary)
                            }
                            .padding(.horizontal)
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
               
                    // Start Date End
                    
                    // End Date Begin
                    Button(action: {
                        print("end date")
                        isEndDatePresented.toggle()
                    }) {
                        HStack {
                            HStack {
                                VStack {
                                    HStack{
                                        Text("End Date")
                                            .font(.subheadline)
                                            .foregroundStyle(Color.secondary)
                                        Spacer()
                                    }
                                    HStack {
                                        Text("\(formattedDate(endDate))")
                                            .foregroundStyle(Color.primary)
                                            .fontWeight(.semibold)
                                            .font(.title3)
                                        Spacer()
                                    }
                                }.padding(.vertical, 12)
                                
                                Spacer()
                                Image(systemName: "calendar")
                                    .font(.system(size: 16))
                                    .foregroundStyle(Color.secondary)
                            }
                            .padding(.horizontal)
                        }
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
               
                    // End Date End
                    
                    // Current Date Begin
                    Button(action: {
                        print("current date")
                        isCurrentDatePresented.toggle()
                    }) {
                        HStack {
                            HStack {
                                VStack {
                                    HStack{
                                        Text("Current Date")
                                            .font(.subheadline)
                                            .foregroundStyle(Color.secondary)
                                        Spacer()
                                    }
                                    HStack {
                                        Text("\(formattedDate(currentDate))")
                                            .foregroundStyle(Color.primary)
                                            .fontWeight(.semibold)
                                            .font(.title3)
                                        Spacer()
                                    }
                                }.padding(.vertical, 12)
                                
                                Spacer()
                                Image(systemName: "calendar")
                                    .font(.system(size: 16))
                                    .foregroundStyle(Color.secondary)
                            }
                            .padding(.horizontal)
                        }
                        .sheet(isPresented: $isCurrentDatePresented) {
                            VStack {
                                DatePicker("", selection: $currentDate, displayedComponents: .date)
                                    .labelsHidden()
                                    .datePickerStyle(WheelDatePickerStyle())
                                    .padding()

                                Button("Done") {
                                    isCurrentDatePresented.toggle()
                                }
                                .padding()
                            }
                        }
                    }
               
                    // current Date End
                }
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color(uiColor: .secondarySystemBackground))
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                
                // Mileage VStack Begin
                
                VStack {
                    // Start Mileage Begin
                    HStack {
                        HStack {
                            VStack {
                                HStack{
                                    Text("Start Mileage")
                                        .font(.subheadline)
                                        .foregroundStyle(Color.secondary)
                                    Spacer()
                                }
                                HStack {
                                    TextField("Start Mileage", text: $startMileage)
                                        .foregroundStyle(Color.primary)
                                        .fontWeight(.semibold)
                                        .font(.title3)
                                    Spacer()
                                }
                            }.padding(.vertical, 12)
                            
                            Spacer()
                            Image(systemName: "square.and.pencil")
                                .font(.system(size: 16))
                                .foregroundStyle(Color.secondary)
                        }
                        .padding(.horizontal)
                    }
                    
                    // Start Mileage End
                    Divider().padding(.horizontal)
                    
                    // Mileage Limit Begin
                    HStack {
                        HStack {
                            VStack {
                                HStack{
                                    Text("Lease Mileage Lmit")
                                        .font(.subheadline)
                                        .foregroundStyle(Color.secondary)
                                    Spacer()
                                }
                                HStack {
                                    TextField("Lease Mileage Limit", text: $mileageLimit)
                                        .foregroundStyle(Color.primary)
                                        .fontWeight(.semibold)
                                        .font(.title3)
                                    Spacer()
                                }
                            }.padding(.vertical, 12)
                            
                            Spacer()
                            Image(systemName: "square.and.pencil")
                                .font(.system(size: 16))
                                .foregroundStyle(Color.secondary)
                        }
                        .padding(.horizontal)
                    }
                    
                    
                    
                    // Mileage Limit End
                    Divider().padding(.horizontal)
                    
                    // Current Mileage Begin
                   
                    HStack {
                        HStack {
                            VStack {
                                HStack{
                                    Text("Current Mileage")
                                        .font(.subheadline)
                                        .foregroundStyle(Color.secondary)
                                    Spacer()
                                }
                                HStack {
                                    TextField("Current Mileage", text: $currentMileage)
                                        .foregroundStyle(Color.primary)
                                        .fontWeight(.semibold)
                                        .font(.title3)
                                    Spacer()
                                }
                            }.padding(.vertical, 12)
                            
                            Spacer()
                            Image(systemName: "square.and.pencil")
                                .font(.system(size: 16))
                                .foregroundStyle(Color.secondary)
                        }
                        .padding(.horizontal)
                    }
                    
               
                    // Current Mileage End
                }
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color(uiColor: .secondarySystemBackground))
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                
                
                // mileage VStack End
                
                
                // Overage fee start
                    HStack {
                        HStack {
                            VStack {
                                HStack{
                                    Text("Overage Fee")
                                        .font(.subheadline)
                                        .foregroundStyle(Color.secondary)
                                    Spacer()
                                }
                                HStack {
                                    Text("$")
                                    TextField("", text: $overageFee, prompt: Text(overageFee))
                                        .keyboardType(.numberPad)
                                        .foregroundStyle(Color.primary)
                                        .fontWeight(.semibold)
                                        .font(.title3)
                                    Spacer()
                                }
                            }.padding(.vertical, 12)
                            
                            Spacer()
                            Image(systemName: "square.and.pencil")
                                .font(.system(size: 16))
                                .foregroundStyle(Color.secondary)
                        }
                        .padding(.horizontal)
                    }
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color(uiColor: .secondarySystemBackground))
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                )
                .padding(.horizontal, 20)
                // overage fee end
                
                // Update Button Section Begin
                HStack {
                    Spacer()
                    Button(action: {
                        let currentMileageInt = Int(currentMileage)
                        let startMileageInt = Int(startMileage)
                        
                        guard !startMileage.isEmpty && !mileageLimit.isEmpty && !currentMileage.isEmpty else {
                            alertMessage = "Can not contain empty fields"
                            showAlert = true
                            return
                        }
                        
                        guard startMileageInt! <= currentMileageInt! else {
                            alertMessage = "Current mileage can not be less than start mileage"
                            showAlert = true
                            return
                        }
                        
                        guard startDate <= currentDate else {
                            alertMessage = "Current date can not be before start date"
                            showAlert = true
                            return
                        }
                        
                        guard currentDate <= endDate else {
                            alertMessage = "Current date can not be after end date"
                            showAlert = true
                            return
                        }
                        
                        guard startDate < endDate else {
                            alertMessage = "End date must occur after start date"
                            showAlert = true
                            return
                        }
                        
                        print("button pressed")
                        // update lease
                        // navigate back to root
                        
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color("PurpleButton"))
                                .frame(maxWidth: 120, maxHeight: 44)
                                .shadow(radius: 5)
                            
                            Text("Update")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .font(.title3)
                        }
                    }
                }
                .padding(.top)
                .padding(.horizontal, 20)
                // Update Button Section End
                Spacer()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
        .onAppear {
            self.startDate = editLease?.startDate ?? Date()
            self.endDate = editLease?.startDate ?? Date()
            self.currentDate = editLease?.startDate ?? Date()
            self.startMileage = String(editLease?.startMileage ?? 0)
            self.mileageLimit = String(editLease?.mileageLimit ?? 0)
            self.currentMileage = String(editLease?.currentMileage ?? 0)
            self.overageFee = String(editLease?.overageFee ?? 0)
            
        }
    }
}

//#Preview {
//    EditLeaseScreenView()
//}
//#Preview {
//    EditLeaseScreenView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//}
