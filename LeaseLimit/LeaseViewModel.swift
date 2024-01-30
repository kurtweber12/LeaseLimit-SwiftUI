//
//  LeaseViewModel.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 12/24/23.
//

import Foundation
import Observation

@Observable
class LeaseViewModel {
    private var lease = LeaseObject(currentDate: Date(), startDate: Date(), endDate: Date(), mileageLimit: 0, monthlyMileage: 0.0, dailyMileage: 0.0, startMileage: 0, currentMileage: 0, overageFee: 0.0)
    
    
    func currentDate() {
        lease.currentDate = Date()
    }
    
    func startDate(start: Date) {
        lease.startDate = start
    }
    func endDate(end: Date) {
        lease.endDate = end
    }
    
    func yearlyMileage(yearlyMiles: String) {
        // need int
        lease.mileageLimit = Int(yearlyMiles)!
    }
    
    func currentMileage(currentMiles: String) {
        // need int
        lease.curretMileage = Int(currentMiles)!
    }
    
    func startMileage(startMiles: String) {
        // need int
        lease.startMileage = Int(startMiles)!
    }
    
    func overageFee(overage: String) {
        // need double
        lease.overageFee = Double(overage)!
    }
    
    func calculateMonthlyMileage() {
        
    }
    
    func calculateDailyMileage() {
        
    }
    
    func printLease() {
        print(lease.mileageLimit)
    }
    
    func printDates() {
        print(lease.startDate)
        print(lease.endDate)
    }
    
    func printMileage() {
        print(lease.startMileage)
        print(lease.curretMileage)
    }
    
    func updateUserDefaults(status: Bool) {
        UserDefaults.standard.set(status, forKey: "isWalkThroughCompleted")
        print(UserDefaults.standard.bool(forKey: "isWalkThroughCompleted"))
    }
    
    
    
    
    
}
