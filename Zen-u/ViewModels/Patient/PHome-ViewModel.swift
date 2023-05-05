//
//  PHome.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 29/04/23.
//

import Foundation
import FirebaseAuth
import UIKit

extension PHome{
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
        @Published var userName: String = ""
        @Published var greeting: String = ""
        @Published var upcomingAppointments: [Appointment] = []
        let emergencyNumber: String = "+917807041670"
        
        let db = FirebaseConfig().db
        
        init() {
            isLoading = true
            
            guard let currentUserData = UserDefaults.standard.data(forKey: "currentUser") else { fatalError("No Active User!!!") }
            let decoder = JSONDecoder()
            guard let currentUser = try? decoder.decode(User.self, from: currentUserData) else { fatalError("Invalid User!!!") }
            userName = currentUser.name
            
            greeting = setGreeting()
            
            Task {
                upcomingAppointments = await getUpcomingAppointment()
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
        
        func getUpcomingAppointment() async -> [Appointment]{
            do {
                var upcomingAppointment: [Appointment] = []
                let currentUserId = Auth.auth().currentUser!.uid
                let currentPatient = try await db.collection("Patient").document(currentUserId).getDocument(as: Patient.self)
                print(currentPatient)
                for appointmentId in currentPatient.appointments ?? [] {
                    let appointmentRawDetails = try await db.collection("Appointment").document(appointmentId).getDocument(as: AppointmentRaw.self)
                    let appointmentDetails = Appointment(
                        id: appointmentId,
                        appointmentTime: Date(timeIntervalSince1970: TimeInterval(appointmentRawDetails.appointmentTime)),
                        doctor: try await db.collection("Doctor").document(appointmentRawDetails.doctor).getDocument(as: DoctorRaw.self),
                        type: try await db.collection("AppointmentType").document(appointmentRawDetails.type).getDocument(as: AppointmentTypeRaw.self)
                    )
                    if(appointmentDetails.appointmentTime > Date() && Calendar.current.isDateInToday(appointmentDetails.appointmentTime) ){
                        upcomingAppointment.append(appointmentDetails)
                    }
                }
                return upcomingAppointment.sorted { $0.appointmentTime < $1.appointmentTime }
            } catch {
                fatalError("\(error)")
            }
        }
        
        func emergencyCall() {
            if let phoneCallURL = URL(string: "tel://\(emergencyNumber)") {
                if UIApplication.shared.canOpenURL(phoneCallURL) {
                    UIApplication.shared.open(phoneCallURL, options: [:], completionHandler: nil)
                }
            }
        }
    }
}
