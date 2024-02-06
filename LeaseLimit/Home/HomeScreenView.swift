//
//  MainScreenView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/9/24.
//

import SwiftUI
import SwiftData

struct HomeScreenView: View {
    @State private var currentDate = Date()
    @State private var currentMileage = ""
    @FocusState private var isMileageFocused: Bool
    
    @State private var showAlert: Bool = false
    
    @Environment(NavigationCoordinator.self) var coordinator: NavigationCoordinator
    @Environment(LeaseViewModel.self) var lease: LeaseViewModel
    @Environment(\.modelContext) var context
    
    @Query var items: [LeaseModel]
    var mainLease: LeaseModel? { items.first }
    
    @State private var userAction: UserAction? = nil
    
    enum UserAction {
        case yes, cancel
    }
        
    
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
            
            VStack{
                VStack(spacing: 7) {
                    HStack {
                        Text("Lease Information")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 30)
                            .padding(.horizontal, 30)
                            .padding(.bottom, -15)
                        Spacer()
                    }
                   
                    VStack{
                        VStack(spacing: 11) {
                            HStack {
                                //Text(String(format: "%.2f", myDoubleValue))
                                Text("Daily Allowed Mileage")
                                Spacer()
                                Text(String(format: "%.2f", mainLease?.dailyMileage ?? 0.0))
                            }
                            Divider()
                            HStack {
                                Text("Monthly Allowed Mileage")
                                Spacer()
                                Text(String(format: "%.2f", mainLease?.monthlyMileage ?? 0.0))
                            }
                            Divider()
                            HStack {
                                Text("Current Mileage")
                                Spacer()
                                Text("\(mainLease?.currentMileage ?? 0)")
                            }
                            Divider()
                            HStack {
                                Text("Current Date")
                                Spacer()
                                Text("\(formattedDate(mainLease?.currentDate ?? Date()))")
                            }
                            Divider()
                            HStack {
                                Text("Start Date")
                                Spacer()
                                Text("\(formattedDate(mainLease?.startDate ?? Date()))")
                            }
                            Divider()
                            HStack {
                                Text("End Date")
                                Spacer()
                                Text("\(formattedDate(mainLease?.endDate ?? Date()))")
                            }
                            Divider()
                            HStack {
                                Text("Mileage Allowed")
                                Spacer()
                                Text(String(mainLease?.mileageLimit ?? 0))
                            }
                            Divider()
                            HStack {
                                Text("Miles Remaining")
                                Spacer()
                                Text(String(mainLease?.remainingMileage ?? 0))
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
                    
                    
                    // Update Fields Section START
                    HStack {
                        Text("Update Fields")
                            .font(.headline)
                            .underline()
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, -15)

                    VStack {
                        VStack(spacing: 11) {
                            Button(action: {
                                // set the date to be current right when this is pressed
                                lease.setCurrentDate()
                                mainLease?.currentDate = lease.getCurrentDate()
                                // uncomment above line once db is integrated
                            }) {
                                HStack {
                                    Text("Update Current Date")
                                    Spacer()
                                    Image(systemName: "calendar")
                                        .font(.system(size: 16))
                                        .foregroundStyle(Color.secondary)
                                }
                            }
                            Divider()
                            Button(action: {
                                coordinator.push(.updateCurrentMileageScreen)
                            }) {
                                HStack {
                                    Text("Update Mileage")
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 16))
                                        .foregroundStyle(Color.secondary)
                                }
                            }
//                            Divider()
//                            Button(action: {
//                                coordinator.push(.editLeaseScreen)
//                                
//                            }) {
//                                HStack {
//                                    Text("Edit Lease")
//                                    Spacer()
//                                    Image(systemName: "chevron.right")
//                                        .font(.system(size: 16))
//                                        .foregroundStyle(Color.secondary)
//                                }
//                            }
                            
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                        .foregroundStyle(Color.primary)
                        
                        
                    }
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color(uiColor: .secondarySystemBackground))
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    )
                    .padding(20)
                    
                    // Update Fields Section END
                    
                    
                    // Delete Section START
                    VStack {
                        VStack(spacing: 11) {
                            Button(action: {
                                showAlert = true
                            }) {
                                HStack {
                                    Text("Delete Lease")
                                    Spacer()
                                    Image(systemName: "trash")
                                        .font(.system(size: 16))
                                }
                                .foregroundStyle(Color.red)
                            }
                            
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                        .foregroundStyle(Color.primary)
                        
                        
                    }
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color(uiColor: .secondarySystemBackground))
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    )
                    .padding(20)
                    
                    // Delete Section END
                    
                    Spacer()
                }
            }
        }
        //alert here
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Delete Lease"), 
                  message: Text("Are you sure you want to delete your lease? This can not be undone."),
                  primaryButton: .default(Text("Yes")) {
                        print("Deleting lease")
                        showAlert = false
                        context.delete(items[0])
                        lease.deleteLease()
                        coordinator.popToRoot()
                        
                    },
                secondaryButton: .cancel(Text("Cancel")) {
                    showAlert = false
                })
        }

    }
}

//#Preview {
//    HomeScreenView()
//}
//#Preview {
//    HomeScreenView().preferredColorScheme(.dark)
//}
