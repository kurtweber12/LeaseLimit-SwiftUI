//
//  StartScreenView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/10/24.
//

import SwiftUI
import SwiftData

struct StartScreenView: View {
    @Query private var leases: [LeaseModel]
    
    //@Binding var path: [String]
    @Environment(NavigationCoordinator.self) var coordinator: NavigationCoordinator
    @Environment(LeaseViewModel.self) var lease: LeaseViewModel

    
//    NavigationLink(value: "View 2") {
//        Text("Go to Screen 2")
//    }
//    .navigationDestination(for: String.self) { pathValue in
//        // depending on the value you pass you will navigate accrodingly
//        if pathValue == "View 2" {
//            Screen2(path: $path)
//        } else if pathValue == "View 3" {
//            Screen3(path: $path)
//        }
//    }
    
    
    var body: some View {
        NavigationStack {
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
                    Image("LeaseLimitLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(30)
                    Text("The best way to track your lease mileage.")
                        .padding(35)
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    Spacer()
                    HStack{
                        Spacer()
                         
                        Button(action: {
                            coordinator.push(.leaseMileageScreen)
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color("PurpleButton"))
                                    .frame(maxWidth: 170, maxHeight: 44) // Adjust height as needed
                                    .shadow(radius: 5)
                                
                                Text("Get Started →")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                    .font(.title3)
                            }
                        }
//                        .navigationDestination(for: String.self) { string in
//                            // add logic here for creating lease object
//                            LeaseMileageScreenView(path: $path)
//                        }
                        
//                            Button(action: {
//                                    print("Created Lease")
//                                    path.append("MileageScreen")
//                                    //addLease()
//    //                                for lease in leases {
//    //                                    print(lease)
//    //                                }
//                                    
//                                }) {
//                                    
//                                    
//                                }

                    }
                    .padding(30)
                }
            }
        }
    }
    
    func addLease() {
        for lease in leases {
            print(lease)
        }
        // create lease with empty fields which we will update on the following screens
        //let newLease = LeaseModel(currentDate: Date(), startDate: Date(), endDate: Date(), mileageLimit: 0, monthlyMileage: 0.0, dailyMileage: 0.0, startMileage: 0, currentMileage: 0, overageFee: 0.0)
        // add lease to database
        //context.insert(newLease)
    }
}

//#Preview {
//    StartScreenView(path: <#Binding<[String]>#>)
//}
//#Preview {
//    StartScreenView(path: <#Binding<[String]>#>).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//}


//#Preview {
//    StartScreenView()
//}
//#Preview {
//    StartScreenView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//}
