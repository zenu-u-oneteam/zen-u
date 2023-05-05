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
        @Published var upcomingAppointments: [AppointmentData] = []
        @Published var numberOfAppointments: Int = 0
        @Published var shiftTime: [Int] = []
        let currentDate = Date()
        
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
        
        func getUpcomingAppointments() async -> [AppointmentData] {
            do {
                let calendar = Calendar.current
                let startTime = calendar.startOfDay(for: Date())
                let endTime = calendar.date(byAdding: .day, value: 1, to: startTime)!

                let currentUserId = Auth.auth().currentUser!.uid
                let currentDoctor = try await db.collection("Doctor").document(currentUserId).getDocument(as: DoctorRaw.self)
                var upcomingAppointments: [AppointmentData] = []
                for appointmentId in currentDoctor.appointments ?? [] {
                    let appointmentRawDetails = try await db.collection("Appointment").document(appointmentId).getDocument(as: AppointmentRaw.self)
                    let appointmentDetails = Appointment(
                        id: appointmentId,
                        appointmentTime: Date(timeIntervalSince1970: TimeInterval(appointmentRawDetails.appointmentTime)),
                        patient: try await db.collection("Patient").document(appointmentRawDetails.patient).getDocument(as: PatientRaw.self),
                        type: try await db.collection("AppointmentType").document(appointmentRawDetails.type).getDocument(as: AppointmentTypeRaw.self)
                    )
                    let patientUser = try await db.collection("Users").document(appointmentRawDetails.patient).getDocument(as: User.self)
                    
                    if appointmentDetails.appointmentTime <= endTime && appointmentDetails.appointmentTime >= currentDate {
                        upcomingAppointments.append(AppointmentData(appointment: appointmentDetails, patientUser: patientUser))
                        print(appointmentDetails)
                    }
                }
                
                upcomingAppointments = upcomingAppointments.sorted(by: { $0.appointment.appointmentTime < $1.appointment.appointmentTime })
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
        
        func getShiftTime() async -> [Int] {
            do {
                let currentUserId = Auth.auth().currentUser!.uid
                let doctor = try await db.collection("Doctor").document(currentUserId).getDocument(as: DoctorRaw.self)
                let shifttime = [doctor.startTime,doctor.endTime]
                return shifttime
            } catch {
                fatalError("\(error)")
            }
        }
    }
}
 
