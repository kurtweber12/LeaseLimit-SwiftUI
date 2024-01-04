//
//  LeaseModel.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 12/22/23.
//

import Foundation
import SwiftData

// add a part of the model for cost for mileage overages, and if user has started app before, which should default to false

@Model
class LeaseModel {
    let currentDate: Date
    let endDate: Date
    let mileageLimit: Int
    let monthlyMileage: Double
    let dailyMileage: Double
    let curretMileage: Int
    let leaseExists: Bool
    
    init(currentDate: Date, endDate: Date, mileageLimit: Int, monthlyMileage: Double, dailyMileage: Double, currentMileage: Int) {
        self.currentDate = currentDate
        self.endDate = endDate
        self.mileageLimit = mileageLimit
        self.monthlyMileage = monthlyMileage
        self.dailyMileage = dailyMileage
        self.curretMileage = currentMileage
        self.leaseExists = false
    }
    
}
