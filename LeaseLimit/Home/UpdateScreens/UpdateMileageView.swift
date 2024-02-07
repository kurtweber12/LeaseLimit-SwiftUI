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
                            mainLease?.remainingMileage = remainingMiles()
                            mainLease?.dailyMileage = dailyMileage()
                            mainLease?.monthlyMileage = monthlyMileage()
                            
//                            mainLease?.remainingMileage = lease.getRemainingMiles()
//                            mainLease?.dailyMileage = lease.getDailyMileage()
//                            mainLease?.monthlyMileage = lease.getMonthlyMileage()
                            
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
    
    func remainingMiles() -> Int {
        return (mainLease?.mileageLimit ?? 0) - (mainLease?.currentMileage  ?? 0)
    }
    
    func dailyMileage() -> Double {
        let remainingDays = daysRemainingInLease()
        let remainingMiles = remainingMiles()
        let dailyMileageAllowance = Double(remainingMiles) / Double(remainingDays)
        
        return dailyMileageAllowance
    }
    
    func daysRemainingInLease() -> Int {
        let calendar = Calendar.current
        
        // calculate the remaining number of days in the lease period
        let daysRange = calendar.dateComponents([.day], from: mainLease?.currentDate ?? Date(), to: mainLease?.endDate ?? Date())
            
        let remainingDays = daysRange.day!
        print("Total Days Remaining In Lease: \(remainingDays)")
        return remainingDays
    }
    
    func monthlyMileage() -> Double {
        let totalMonths = totalMonthsInLease()
        
        let monthlyMileageAllowance = Double(mainLease?.remainingMileage ?? 0) / Double(totalMonths)
        return monthlyMileageAllowance
       
    }
    
    func totalDaysInLease() -> Int {
        let calendar = Calendar.current
        
        // calculate the total number of days in the lease period
        let daysRange = calendar.dateComponents([.day], from: mainLease?.startDate ?? Date(), to: mainLease?.endDate ?? Date())
            
        // Adding 1 to include start day
        let totalDays = daysRange.day! + 1
        print("Total Days In Lease: \(totalDays)")
        return totalDays
    }
    
    func totalMonthsInLease() -> Int {
        let calendar = Calendar.current
        
        // calculate the total number of months in the lease period
        let monthsRange = calendar.dateComponents([.month], from: mainLease?.startDate ?? Date(), to: mainLease?.endDate ?? Date())
            
        // Adding 1 to include end day
        let totalMonths = monthsRange.month! + 1
        print("Total Months In Lease: \(totalMonths)")
        return totalMonths
    }
}

#Preview {
    UpdateMileageView()
}
#Preview {
    UpdateMileageView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
