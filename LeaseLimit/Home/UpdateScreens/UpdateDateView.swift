//
//  UpdateDateView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/10/24.
//

import SwiftUI

struct UpdateDateView: View {
    @State private var currentdate = Date()
    
    @State private var showAlert: Bool = false
    
//    VStack {
//        DatePicker("", selection: $currentdate, displayedComponents: .date)
//            .labelsHidden()
//            .datePickerStyle(WheelDatePickerStyle())
//            .padding()
//
//        Button("Done") {
//           // save new value to model and pop off navigation stack
//            //path.removeLast(1)
//        }
//        .padding()
//    }
    
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
                Text("Update Current Mileage")
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                    .font(.title3)
                VStack {
                    
                    
                    HStack {
                        Spacer()
                        Button(action: {
//                            guard currentdate else {
//                                showAlert = true
//                                return
//                            }
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
                }
                .padding(20)
                Spacer()
            }
            
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Mileage input cannot be empty or non-numeric"), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    UpdateDateView()
}
#Preview {
    UpdateDateView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
