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
    @State private var path = [String]()
    
    //@Environment(\.modelContext) var context

    @State private var coordinator = NavigationCoordinator()
    
    @State private var lease = LeaseViewModel()
    
    private var isWalkThroughComplete = UserDefaults.standard.bool(forKey: "isWalkThroughCompleted")
    
    var body: some View {
        NavigationStack(path: $coordinator.paths) {
            if UserDefaults.standard.bool(forKey: "isWalkThroughCompleted") {
                coordinator.navigate(to: .homeScreen)
                    .navigationDestination(for: Screens.self) { screen in
                        coordinator.navigate(to: screen)
                    }
            } else {
                coordinator.navigate(to: .startScreen)
                    .navigationDestination(for: Screens.self) { screen in
                        coordinator.navigate(to: screen)
                    }
            }
        }
        .environment(coordinator)
        .environment(lease)

    }
}

#Preview {
    ContentView()
}
#Preview {
    ContentView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}

