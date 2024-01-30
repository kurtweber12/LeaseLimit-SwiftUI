//
//  UpdateDateView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/10/24.
//

import SwiftUI

struct UpdateDateView: View {
    @State private var currentdate = Date()
    
    var body: some View {
        VStack {
            DatePicker("", selection: $currentdate, displayedComponents: .date)
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
                .padding()

            Button("Done") {
               // save new value to model and pop off navigation stack
                //path.removeLast(1)
            }
            .padding()
        }
    }
}

#Preview {
    UpdateDateView()
}
#Preview {
    UpdateDateView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
