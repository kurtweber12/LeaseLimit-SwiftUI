//
//  LeaseClass.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/29/24.
//

import Foundation

struct LeaseObject {
    var currentDate: Date
    var startDate: Date
    var endDate: Date
    var mileageLimit: Int
    var monthlyMileage: Double
    var dailyMileage: Double
    var startMileage: Int
    var curretMileage: Int
    var overageFee: Double
    var leaseExists: Bool
    
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
