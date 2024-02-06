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
    var currentDate: Date
    var startDate: Date
    var endDate: Date
    var mileageLimit: Int
    var monthlyMileage: Double
    var dailyMileage: Double
    var startMileage: Int
    var currentMileage: Int
    var remainingMileage: Int
    var overageFee: Double

    
    init(currentDate: Date, startDate: Date, endDate: Date, mileageLimit: Int, monthlyMileage: Double, dailyMileage: Double, startMileage: Int, currentMileage: Int, remainingMileage: Int, overageFee: Double) {
        self.currentDate = currentDate
        self.startDate = startDate
        self.endDate = endDate
        self.mileageLimit = mileageLimit
        self.monthlyMileage = monthlyMileage
        self.dailyMileage = dailyMileage
        self.startMileage = startMileage
        self.currentMileage = currentMileage
        self.remainingMileage = remainingMileage
        self.overageFee = overageFee
    }
    
}
