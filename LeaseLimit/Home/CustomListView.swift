//
//  CustomListView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/30/24.
//

import SwiftUI

struct CustomListView: View {
    var body: some View {
        VStack {
            VStack(spacing: 11) {
                Button(action: {
                    // set the date to be current right when this is pressed
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
                Button(action: {}) {
                    HStack {
                        Text("Update Mileage")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.system(size: 16))
                            .foregroundStyle(Color.secondary)
                    }
                }
                Divider()
                Button(action: {}) {
                    HStack {
                        Text("Edit Lease")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.system(size: 16))
                            .foregroundStyle(Color.secondary)
                    }
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
    }
}

#Preview {
    CustomListView()
}
