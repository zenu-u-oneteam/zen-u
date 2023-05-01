//
//  PSlotSelection-ViewModel.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 01/05/23.
//

import Foundation

extension PSlotSelection {
    @MainActor class ViewModel: ObservableObject {
        @Published var userLocale = Locale.autoupdatingCurrent
        @Published var availableSlots: [Date] = [Date()]
        @Published var selectedSlot: Date?
        @Published var upcomingMonth: [Date] = []
        @Published var selectedDate: Date = Date()
        let todaysDate = Date()

        init() {
            fetchUpcomingMonth()
        }
        
        func fetchUpcomingMonth() {
            
            var calendar = Calendar.current
            let today = calendar.startOfDay(for: Date())
            calendar.locale = userLocale

            (0...30).forEach{ day in
                if let weekday = calendar.date(byAdding: .day, value: day, to: today){
                    upcomingMonth.append(weekday)
                }
            }
            setSelectedDate(upcomingMonth[0])
        }
        
        func setSelectedDate(_ date: Date) {
            selectedDate = date
            getAvailableSlots(date)
        }
        
        func getAvailableSlots(_ date: Date) {
            
            let calendar = Calendar.current
            let endDate = calendar.date(byAdding: .day, value: 1, to: date)!

            var dateArray = [Date]()
            var currentDate = date

            while currentDate < endDate {
                if currentDate > todaysDate {
                    dateArray.append(currentDate)
                }
                currentDate = calendar.date(byAdding: .minute, value: 30, to: currentDate)!
            }

            availableSlots = dateArray
        }
        
        func extractDate(date: Date, format: String) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = format
            return formatter.string(from: date)
        }
        
        func extractTime(timeStamp: Int, format: String) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = format
            return formatter.string(from: Date(timeIntervalSince1970: TimeInterval(timeStamp)))
        }

    }
}
