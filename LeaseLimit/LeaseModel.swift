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
    let startDate: Date
    let endDate: Date
    let mileageLimit: Int
    let monthlyMileage: Double
    let dailyMileage: Double
    let startMileage: Int
    let curretMileage: Int
    let overageFee: Double
    let leaseExists: Bool
    
    init(currentDate: Date, startDate: Date, endDate: Date, mileageLimit: Int, monthlyMileage: Double, dailyMileage: Double, startMileage: Int, currentMileage: Int, overageFee: Double) {
        self.currentDate = currentDate
        self.startDate = startDate
        self.endDate = endDate
        self.mileageLimit = mileageLimit
        self.monthlyMileage = monthlyMileage
        self.dailyMileage = dailyMileage
        self.startMileage = startMileage
        self.curretMileage = currentMileage
        self.overageFee = overageFee
        self.leaseExists = false
    }
    
}
