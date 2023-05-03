//
//  DHome-ViewModel.swift
//  Zen-u
//
//  Created by Prakhar Singh on 02/05/23.
//

import Foundation
import FirebaseAuth

extension DHome{
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
        @Published var userName: String = ""
        @Published var greeting: String = ""
        @Published var upcomingAppointments: [Appointment] = []
        @Published var numberOfAppointments: Int = 0
        @Published var shiftTime: (startTime: String, endTime: String)?
        
        let db = FirebaseConfig().db
        
        init() {
            isLoading = true
            
            guard let currentUserData = UserDefaults.standard.data(forKey: "currentUser") else { fatalError("No Active User!!!") }
            let decoder = JSONDecoder()
            guard let currentUser = try? decoder.decode(User.self, from: currentUserData) else { fatalError("Invalid User!!!") }
            userName = currentUser.name
            
            greeting = setGreeting()
            
            Task {
                upcomingAppointments = await getUpcomingAppointments()
                numberOfAppointments = await getNumberOfAppointments()
                shiftTime = await getShiftTime()
                isLoading = false
                print(upcomingAppointments)
                print(numberOfAppointments)
                print(shiftTime ?? 0)
            }
        }
        
        func setGreeting() -> String {
            let hour = Calendar.current.component(.hour, from: Date())
            
            let newDay = 0
            let noon = 12
            let sunset = 18
            let midnight = 24
            
            var greetingText = "Hello"
            
            switch hour {
            case newDay..<noon:
                greetingText = "Good Morning"
            case noon..<sunset:
                greetingText = "Good Afternoon"
            case sunset..<midnight:
                greetingText = "Good Evening"
            default:
                greetingText = "Hello"
            }
            
            return greetingText
        }
        
        func getUpcomingAppointments() async -> [Appointment] {
            do {
                let currentUserId = Auth.auth().currentUser!.uid
                let currentPatient = try await db.collection("Doctor").document(currentUserId).getDocument(as: DoctorRaw.self)
                var upcomingAppointments: [Appointment] = []
                for appointmentId in currentPatient.appointments ?? [] {
                    let appointmentRawDetails = try await db.collection("Appointment").document(appointmentId).getDocument(as: AppointmentRaw.self)
                    let appointmentDetails = Appointment(
                        id: appointmentId,
                        appointmentTime: Date(timeIntervalSince1970: TimeInterval(appointmentRawDetails.appointmentTime)),
                        doctor: try await db.collection("Doctor").document(appointmentRawDetails.doctor).getDocument(as: DoctorRaw.self),
                        type: try await db.collection("AppointmentType").document(appointmentRawDetails.type).getDocument(as: AppointmentTypeRaw.self)
                    )
                    upcomingAppointments.append(appointmentDetails)
                }
                return upcomingAppointments
            } catch {
                print(error)
                fatalError("\(error)")
            }
        }
        
        func getNumberOfAppointments() async -> Int {
            do {
                let currentUserId = Auth.auth().currentUser!.uid
                let doctor = try await db.collection("Doctor").document(currentUserId).getDocument(as: DoctorRaw.self)
                return doctor.appointments?.count ?? 0
            } catch {
                fatalError("\(error)")
            }
        }
        
        func getShiftTime() async -> (startTime: String, endTime: String)? {
            do {
                let currentUserId = Auth.auth().currentUser!.uid
                let doctor = try await db.collection("Doctor").document(currentUserId).getDocument(as: DoctorRaw.self)

                var calender = Calendar.current
                calender.timeZone = TimeZone(identifier: "Asia/Kolkata")!
                
                let currentDate = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "h:mm a"
                
                var startTimeDateComponent = DateComponents(
                    year: calender.component(.year, from: currentDate),
                    month: calender.component(.month, from: currentDate),
                    day: calender.component(.day, from: currentDate),
                    hour: doctor.startTime,
                    minute: 0,
                    second: 0
                )

                var endTimeDateComponent = DateComponents(
                    year: calender.component(.year, from: currentDate),
                    month: calender.component(.month, from: currentDate),
                    day: calender.component(.day, from: currentDate),
                    hour: doctor.endTime,
                    minute: 0,
                    second: 0
                )

                return (formatter.string(from: calender.date(from: startTimeDateComponent)!), formatter.string(from: calender.date(from: endTimeDateComponent)!))
            } catch {
                fatalError("\(error)")

            }
        }
    }
}
 
