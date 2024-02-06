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
    case homeScreen
    case startScreen
    case leaseMileageScreen
    case datesScreen
    case mileageScreen
    case overageScreen
    case updateCurrentDateScreen
    case updateCurrentMileageScreen
    case editLeaseScreen
    
}

@Observable
class NavigationCoordinator {
    var paths = NavigationPath()

    @ViewBuilder
    func navigate(to screen: Screens) -> some View {
        switch screen {
        case .homeScreen:
            HomeScreenView()
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
        case .updateCurrentDateScreen:
            UpdateDateView()
        case .updateCurrentMileageScreen:
            UpdateMileageView()
        case .editLeaseScreen:
            EditLeaseScreenView()
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
    
    // func here to query the model and push it to the edit screen
}
