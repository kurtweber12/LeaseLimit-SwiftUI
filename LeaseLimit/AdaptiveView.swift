//
//  AdaptiveView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/3/24.
//

import Foundation
import SwiftUI

// purple color is #5D3587

struct AdaptiveView<T: View, U: View>: View {
    @Environment(\.colorScheme) var colorScheme
    let light: T
    let dark: U

    init(light: T, dark: U) {
        self.light = light
        self.dark = dark
    }

    init(light: () -> T, dark: () -> U) {
        self.light = light()
        self.dark = dark()
    }

    @ViewBuilder var body: some View {
        if colorScheme == .light {
            light
        } else {
            dark
        }
    }
}
