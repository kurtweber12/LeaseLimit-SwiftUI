//
//  HomeScreenDemo.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/10/24.
//

// this file was just used for creating a styling that resembled a List {}
// List {} takes up a whole screen so we created a new view that had the same
// styling but allowed for smaller space taken
import SwiftUI

struct HomeScreenDemo: View {
    @State private var currentMileage = ""
    @State private var currentDate = Date()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Daily Mileage")
                        Spacer()
                        Text("1234")
                    }
                    Divider()
                    HStack {
                        Text("Current Date")
                        Spacer()
                        Text("\(formattedDate(currentDate))")
                    }
            Divider()
                    HStack {
                        Text("Another Item")
                        Spacer()
                        Text("123.4")
                    }
            Divider()
                    HStack {
                        Text("Yet Another Item")
                        Spacer()
                        Text("123.4")
                    }

                    Button("Update Mileage") {
                        // Handle the button tap action
                        // You can present the modal or perform other actions
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .padding()
                .background(Color.gray.opacity(0.1)) // Set background color if needed
    }
}

#Preview {
    HomeScreenDemo()
}
