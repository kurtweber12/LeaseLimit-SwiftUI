//
//  LeaseLimitApp.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 12/22/23.
//

import SwiftUI
import SwiftData

@main
struct LeaseLimitApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: LeaseModel.self)
    }
}
