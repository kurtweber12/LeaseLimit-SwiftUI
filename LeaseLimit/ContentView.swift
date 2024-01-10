//
//  ContentView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 12/22/23.
//

import SwiftUI
import SwiftData

// Model: Data
// Container: Where things are saved
// Context: How you interact


// for navigation, we should have our "start" screen and our "home" screen and render
// that view inside content view depending on the value of leaseExists inside our model
// for our navigation, we need to use the navigationPath array and append each screen
// each time we hit next and then on the final finish button, delete everything off the
// stack and at that point, we should have updated our leaseExissts to true so we will
// render the "home" screen then

struct ContentView: View {
    var body: some View {
        StartScreenView()
    }
}

#Preview {
    ContentView()
}
#Preview {
    ContentView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
