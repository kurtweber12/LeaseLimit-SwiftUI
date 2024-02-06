//
//  UpdateMileageView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/10/24.
//

import SwiftUI
import SwiftData

struct UpdateMileageView: View {
    @State private var newMileage: String = ""
    
    @State private var showAlert: Bool = false
    
    @Query var items: [LeaseModel]
    var mainLease: LeaseModel? { items.first }
    
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
                Text("Update Current Mileage")
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                    .font(.title3)
                VStack {
                    TextField("", text: $newMileage, prompt: Text("Enter new mileage").foregroundColor(.purpleButton))
                        .keyboardType(.numberPad)
                        .padding()
                        .foregroundColor(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.textBoxes)
                        )
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            guard !newMileage.isEmpty else {
                                showAlert = true
                                return
                            }
                            
                            print("button pressed")
                            // update lease
                            // navigate back to root
                            lease.updateMileage(miles: newMileage)
                            
                            mainLease?.currentMileage = Int(newMileage) ?? 0
                            mainLease?.remainingMileage = lease.getRemainingMiles()
                            mainLease?.dailyMileage = lease.getDailyMileage()
                            mainLease?.monthlyMileage = lease.getMonthlyMileage()
                            
                            coordinator.pop()
                            
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
    UpdateMileageView()
}
#Preview {
    UpdateMileageView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
