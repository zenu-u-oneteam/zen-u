//
//  PViewModel.swift
//  Zen-u
//
//  Created by Archit Khanna on 20/04/23.
//

import Foundation
import SwiftUI

class DateViewModel: ObservableObject{
    @Published var userLocale = Locale.autoupdatingCurrent
    @Published var currentMonth: [Date] = []
    
    @Published var currentWeek: [Date] = []
    @Published var requestedWeek: [Date] = []
    @Published var currentDay: Date = Date()
    @Published var existingWeek: [Date] = []

    @State var refresh: Bool = false

    
    init(){
        fetchCurrentMonth()
        fetchCurrentWeek()
        fetchExistingWeek()
    }
    
    func update() {
        refresh.toggle()
     }
    
    func fetchCurrentMonth(){
//        print("\nThe current calendar is \(Calendar.current).")
//        print("The current calendar’s time zone is \(Calendar.current.timeZone) ")
        let today = Date()
        var calendar = Calendar.current
        calendar.locale = userLocale
        let interval = calendar.dateInterval(of: .month, for: today)!
        
        let days = calendar.dateComponents([.day], from: interval.start, to: interval.end).day!
        
        for day in 0..<days {
            if let weekday = calendar.date(byAdding: .day, value: day, to: interval.start) {
                currentMonth.append(weekday)
            }
        }
    }
    
    func fetchRequestedMonth(month : Int)-> [Date]{
        var requestedMonth: [Date] = []
        let today = Date()
        var calendar = Calendar.current
        calendar.locale = userLocale
        let components = calendar.dateComponents([.year], from: today)
        let year = components.year
        let startdate = DateComponents(
            calendar: calendar,
            timeZone: TimeZone(identifier: "IST"),
            year: year,
            month: month
            
        )
        let startdatefinal = calendar.date(from: startdate)!
        let interval = calendar.dateInterval(of: .month, for: startdatefinal)!
        
        let days = calendar.dateComponents([.day], from: interval.start, to: interval.end).day!
        
        for day in 0..<days {
            if let weekday = calendar.date(byAdding: .day, value: day, to: interval.start) {
                requestedMonth.append(weekday)
            }
        }
        return requestedMonth
    }
    
    func fetchExistingWeek() {
        
        let today = Date()
        var calendar = Calendar.current
        calendar.locale = userLocale
        
        (0...6).forEach{ day in
            
            if let weekday = calendar.date(byAdding: .day, value: day, to: today){
                existingWeek.append(weekday)
            }
        }
    }
    
    func fetchCurrentWeek() {
        
        let today = Date()
        var calendar = Calendar.current
        calendar.locale = userLocale
    let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else{
            return
        }
        
        (1...7).forEach{ day in
            
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay){
                currentWeek.append(weekday)
            }
        }
    }
    
    func currentMonthValue()-> Int {
        let today = Date()
        var calendar = Calendar.current
        calendar.locale = userLocale
        let components = calendar.dateComponents([.month], from: today)
        let month = components.month
        return month! - 1
        
    }
    
    func currentDateValue()-> Int {
        let today = Date()
        var calendar = Calendar.current
        calendar.locale = userLocale
        let components = calendar.dateComponents([.day], from: today)
        let day = components.day
        return day! - 1
        
    }
    func getMonthValue(date : Date)-> Int {
        var calendar = Calendar.current
        calendar.locale = userLocale
        let components = calendar.dateComponents([.month], from: date)
        let month = components.month
        return month! - 1
        
    }
    
    func getDateValue(date : Date )-> Int {
        var calendar = Calendar.current
        calendar.locale = userLocale
        let components = calendar.dateComponents([.day], from: date)
        let day = components.day
        return day! - 1
        
    }
        func extractDate(date:Date, format:String)->String{
            let formatter = DateFormatter()
            
            formatter.dateFormat = format
            
            return formatter.string(from: date)
        }
        
        func isToday(date: Date)->Bool{
            
            let Calendar = Calendar.current
            return Calendar.isDate(currentDay, inSameDayAs: date)
        }
        
        func currentHour(date:Date)->Bool{
            
            let calendar = Calendar.current
            
            let hour = calendar.component(.hour, from: date)
            let currentHour = calendar.component(.hour, from: Date())
            
            return hour == currentHour
        }
        
        func getCurrentDate() -> Date {
            let now = Date()
            
            let dtFormatter = DateFormatter()
            dtFormatter.dateStyle = .full
            dtFormatter.timeStyle = .full
            
            let formattedDateTime = dtFormatter.string(from: now)
            return dtFormatter.date(from: formattedDateTime)!
        }
    
    func getTimeFromDate(date : Date ) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let time = formatter.string(from: date)
        return time
    }
    
    func getDateFromDate(date : Date ) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        let time = formatter.string(from: date)
        return time
    }
    
    }

