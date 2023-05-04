//
//  PSlotSelection-ViewModel.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 01/05/23.
//

import Foundation
import FirebaseFirestore

extension PSlotSelection {
    @MainActor class ViewModel: ObservableObject {
        private var department: DepartmentRaw
        @Published var isLoading = false
        @Published var canContinue = false
        @Published var userLocale = Locale.autoupdatingCurrent
        @Published var availableSlotsWithDoctor: [Date: [String]] = [:]
        @Published var availableSlots: [Date] = []
        @Published var selectedSlot: Date?
        @Published var upcomingMonth: [Date] = []
        @Published var selectedDate: Date = Date()
        @Published var allotedDoctor: String?
        
        let todaysDate = Date()
        
        let db = FirebaseConfig().db
        
        init(department: DepartmentRaw) {
            self.department = department
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
        
        func selectSlot(_ date: Date) {
            selectedSlot = date
            allotedDoctor = availableSlotsWithDoctor[date]!.randomElement()!
        }
        
        func checkStatus() {
            if selectedSlot != nil {
                canContinue = true
            }
        }
        
        func getAvailableSlots(_ date: Date) {
            
            isLoading = true
            
            let calendar = Calendar.current
            let endDate = calendar.date(byAdding: .day, value: 1, to: date)!
            
            var dateDictionary: [Date: [String]] = [:]
            var dateArray: [Date] = []
            var currentDate = date
            
            while currentDate < endDate {
                if currentDate > todaysDate {
                    dateDictionary[currentDate] = []
                }
                currentDate = calendar.date(byAdding: .minute, value: 30, to: currentDate)!
            }
            
            guard let doctors: [String] = department.doctors else { return }
            
            Task {
                for doctor in doctors {
                    dateDictionary = await findAvailableSlots(doctorID: doctor, selectedDate: date, dateDictionary: dateDictionary)
                }
                                
                for (key, value) in dateDictionary {
                    if value.count == 0 {
                        dateDictionary.removeValue(forKey: key)
                    } else {
                        dateArray.append(key)
                    }
                }
                
                dateArray = dateArray.sorted()
                
                availableSlots = dateArray
                availableSlotsWithDoctor = dateDictionary
                
                isLoading = false
            }
        }
        
        func findAvailableSlots (doctorID: String, selectedDate: Date, dateDictionary: [Date: [String]]) async -> [Date: [String]] {
            do {
                var currentDateDictionary = dateDictionary
                var doctorDetails = try await db.collection("Doctor").document(doctorID).getDocument(as: DoctorRaw.self)
                doctorDetails.id = doctorID
                
                let existingAppointmentDate: [Date] = await getPastAppointments(doctorDetails: doctorDetails)
                
                var calendar = Calendar.current
                
                calendar.timeZone = TimeZone(identifier: "Asia/Kolkata")!
                
                var startDateComponents = DateComponents()
                startDateComponents.hour = doctorDetails.startTime
                startDateComponents.minute = 0
                startDateComponents.year = calendar.component(.year, from: selectedDate)
                startDateComponents.month = calendar.component(.month, from: selectedDate)
                startDateComponents.day = calendar.component(.day, from: selectedDate)
                
                var endDateComponents = startDateComponents
                endDateComponents.hour = doctorDetails.endTime
                
                let startDate = calendar.date(from: startDateComponents)!
                let endDate = calendar.date(from: endDateComponents)!
                
                for (key, value) in currentDateDictionary {
                    if key >= startDate && key < endDate && !existingAppointmentDate.contains(key){
                        var currentValue: [String] = value
                        currentValue.append("\(doctorID)")
                        currentDateDictionary[key] = currentValue
                    }
                }
                
                return currentDateDictionary
                
            } catch {
                fatalError("\(error)")
            }
        }
        
        func getPastAppointments(doctorDetails: DoctorRaw) async -> [Date] {
            do {
                var bookedSlots: [Date] = []
                if doctorDetails.appointments![0].isEmpty {
                    return bookedSlots
                }
                
                let appointmentDetailsSnapshort = try await db.collection("Appointment").whereField(FieldPath.documentID(), in: doctorDetails.appointments!).getDocuments()
                
                for appointment in appointmentDetailsSnapshort.documents {
                    let jsonData = try JSONSerialization.data(withJSONObject: appointment.data(), options: .prettyPrinted)
                    let appointmentData = try JSONDecoder().decode(AppointmentRaw.self, from: jsonData)
                    bookedSlots.append(Date(timeIntervalSince1970: TimeInterval(appointmentData.appointmentTime)))
                }
                return bookedSlots
            } catch {
                fatalError("\(error)")
            }
        }
    }
}
