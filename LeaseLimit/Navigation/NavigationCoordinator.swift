//
//  NavigationCoordinator.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/29/24.
//

import Foundation
import SwiftUI
import Observation

enum Screens {
    case startScreen
    case leaseMileageScreen
    case datesScreen
    case mileageScreen
    case overageScreen
}

@Observable
class NavigationCoordinator {
    var paths = NavigationPath()

    @ViewBuilder
    func navigate(to screen: Screens) -> some View {
        switch screen {
        case .startScreen:
            StartScreenView()
        case .leaseMileageScreen:
            LeaseMileageScreenView()
        case .datesScreen:
            DatesScreenView()
        case .mileageScreen:
            MileageScreenView()
        case .overageScreen:
            OverageScreenView()
        }
    
    }

    func push(_ screen: Screens) {
        paths.append(screen)
    }

    func pop() {
        paths.removeLast()
    }

    func popToRoot() {
        paths.removeLast(paths.count)
    }
}
