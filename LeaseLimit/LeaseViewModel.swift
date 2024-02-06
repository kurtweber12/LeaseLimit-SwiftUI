//
//  LeaseViewModel.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 12/24/23.
//

// this file is for use with the LeaseStruct file (which contains LeaseObject), NOT LeaseModel. LeaseModel is the model used with SwiftData framework
// we create an instance of LeaseObject here and uses this as @Observable so it can be accessed through the different screens of the walkthrough
// once walkthrough is complete, we write to the local database using SwiftData based off the data inside the LeaseObject instance

import Foundation
import Observation

@Observable
class LeaseViewModel {
    private var lease = LeaseObject(currentDate: Date(), startDate: Date(), endDate: Date(), mileageLimit: 0, monthlyMileage: 0.0, dailyMileage: 0.0, startMileage: 0, currentMileage: 0, remainingMileage: 0, overageFee: 0.0)
    
    
    func setCurrentDate() {
        lease.currentDate = Date()
    }
    
    func setStartDate(start: Date) {
        lease.startDate = start
    }
    func setEndDate(end: Date) {
        lease.endDate = end
    }
    
    func setYearlyMileage(yearlyMiles: String) {
        // need int
        lease.mileageLimit = Int(yearlyMiles)!
    }
    
    func setCurrentMileage(currentMiles: String) {
        // need int
        lease.currentMileage = Int(currentMiles)!
    }
    
    func setStartMileage(startMiles: String) {
        // need int
        lease.startMileage = Int(startMiles)!
    }
    
    func setOverageFee(overage: String) {
        // need double
        lease.overageFee = Double(overage)!
    }
    
    func setRemainingMiles() {
        let remainingMiles = remainingMiles()
        lease.remainingMileage = remainingMiles
    }
    
    func getRemainingMiles() -> Int {
        return lease.remainingMileage
    }
    
    func getDailyMileage() -> Double {
        return lease.dailyMileage
    }
    
    func getMonthlyMileage() -> Double {
        return lease.monthlyMileage
    }
    
    func getStartDate() -> Date {
        return lease.startDate
    }
    
    func getCurrentDate() -> Date {
        return lease.currentDate
    }
    
    func getEndDate() -> Date {
        return lease.endDate
    }
    
    func getStartMileage() -> Int {
        return lease.startMileage
    }
    
    func getCurrentMileage() -> Int {
        return lease.currentMileage
    }
    
    func getMileageLimit() -> Int {
        return lease.mileageLimit
    }
    
    func getOverageFee() -> Double {
        return lease.overageFee
    }
    
    
    func totalDaysInLease() -> Int {
        let calendar = Calendar.current
        
        // calculate the total number of days in the lease period
        let daysRange = calendar.dateComponents([.day], from: lease.startDate, to: lease.endDate)
            
        // Adding 1 to include start day
        let totalDays = daysRange.day! + 1
        print("Total Days In Lease: \(totalDays)")
        return totalDays
    }
    
    func totalMonthsInLease() -> Int {
        let calendar = Calendar.current
        
        // calculate the total number of months in the lease period
        let monthsRange = calendar.dateComponents([.month], from: lease.startDate, to: lease.endDate)
            
        // Adding 1 to include end day
        let totalMonths = monthsRange.month! + 1
        print("Total Months In Lease: \(totalMonths)")
        return totalMonths
    }
    
    func daysRemainingInLease() -> Int {
        let calendar = Calendar.current
        
        // calculate the remaining number of days in the lease period
        let daysRange = calendar.dateComponents([.day], from: lease.currentDate, to: lease.endDate)
            
        let remainingDays = daysRange.day!
        print("Total Days Remaining In Lease: \(remainingDays)")
        return remainingDays
    }
    
    func remainingMiles() -> Int {
        let remainingMiles = lease.mileageLimit - (lease.currentMileage - lease.startMileage)
        return remainingMiles
    }
    
    func calculateMonthlyMileage() {
        let totalMonths = totalMonthsInLease()
        
        let monthlyMileageAllowance = Double(lease.mileageLimit) / Double(totalMonths)
        lease.monthlyMileage = monthlyMileageAllowance
        print(lease.monthlyMileage)
    }
    
    func calculateDailyMileage() {
        let totalDays = totalDaysInLease()
        
        // Calculate the daily mileage allowance
        let dailyMileage = Double(lease.mileageLimit) / Double(totalDays)

        print("Daily Mileage For Lease: \(dailyMileage)")
        
        let remainingDays = daysRemainingInLease()
        let remainingMiles = remainingMiles()
        let dailyMileageAllowance = Double(remainingMiles) / Double(remainingDays)
        
        print("Daily Mileage Allowed: \(dailyMileageAllowance)")
        lease.dailyMileage = dailyMileageAllowance
        
    
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
        print(lease.currentMileage)
    }
    
    func updateUserDefaults(status: Bool) {
        UserDefaults.standard.set(status, forKey: "isWalkThroughCompleted")
        print(UserDefaults.standard.bool(forKey: "isWalkThroughCompleted"))
    }
    
    func updateMileage(miles: String) {
        //set current mileage
        setCurrentMileage(currentMiles: miles)
        setRemainingMiles()
        calculateDailyMileage()
        calculateMonthlyMileage()
        
    }
    
    func postLeaseToDB() {
        // function to add lease to the database
    }
    
    func finishLease(){
        updateUserDefaults(status: true)
        calculateDailyMileage()
        calculateMonthlyMileage()
        setRemainingMiles()
        postLeaseToDB()
        
    }
    
    func getLease() -> LeaseObject {
        return lease
    }
    
    func deleteLease() {
        // set userdefault to false
        // delete lease from database
        // pop to root in navigation
        updateUserDefaults(status: false)
        
    }
    
    
    
    
    
}
