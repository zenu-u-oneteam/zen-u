//
//  PViewModel.swift
//  Zen-u
//
//  Created by Archit Khanna on 20/04/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject{
    
    @Published var currentMonth: [Date] = []
    @Published var currentWeek: [Date] = []
    @Published var currentDay: Date = Date()
    
    init(){
        fetchCurrentMonth()
        fetchCurrentWeek()
    }
    
    func fetchCurrentMonth(){
        
        let today = Date()
        let calendar = Calendar.current
        
        let interval = calendar.dateInterval(of: .month, for: today)!
        
        let days = calendar.dateComponents([.day], from: interval.start, to: interval.end).day!
        
        for day in 0..<days {
            if let weekday = calendar.date(byAdding: .day, value: day, to: interval.start) {
                currentMonth.append(weekday)
            }
        }
    }
    
    func fetchCurrentWeek(){
        
        let today = Date()
        let calendar = Calendar.current
        
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
}
