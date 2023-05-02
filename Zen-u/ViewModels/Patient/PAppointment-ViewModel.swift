//
//  PAppointment-ViewModel.swift
//  Zen-u
//
//  Created by Tanvi Gupta on 01/05/23.
//

import Foundation
import FirebaseAuth

extension PAppointment {
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
        @Published var upcomingAppointments: [Appointment] = []
        @Published var pastAppointments: [Appointment] = []
        @Published var consultPastAppointments: [Appointment] = []
        @Published var consultUpAppointments: [Appointment] = []
        @Published var labPastAppointments: [Appointment] = []
        @Published var labUpAppointments: [Appointment] = []
        @Published var vaccPastAppointments: [Appointment] = []
        @Published var vaccUpAppointments: [Appointment] = []
        
        let db = FirebaseConfig().db
        
        init() {
            isLoading = true
         Task {
                upcomingAppointments = await getUpcomingAppointment()
                pastAppointments = await getPastAppointment()
                consultPastAppointments = await getConsultPastAppointments()
                consultUpAppointments = await getConsultUpAppointments()
                isLoading = false
            }
        }
        
    
        
        
        
        func getUpcomingAppointment() async -> [Appointment]{
            do {
                var upcomingAppointment: [Appointment] = []
                let currentUserId = Auth.auth().currentUser!.uid
                let currentPatient = try await db.collection("Patient").document(currentUserId).getDocument(as: Patient.self)
                for appointmentId in currentPatient.appointments ?? [] {
                    let appointmentRawDetails = try await db.collection("Appointment").document(appointmentId).getDocument(as: AppointmentRaw.self)
                    let appointmentDetails = Appointment(
                        id: appointmentId,
                        appointmentTime: Date(timeIntervalSince1970: TimeInterval(appointmentRawDetails.appointmentTime)),
                        doctor: try await db.collection("Doctor").document(appointmentRawDetails.doctor).getDocument(as: DoctorRaw.self),
                        type: try await db.collection("AppointmentType").document(appointmentRawDetails.type).getDocument(as: AppointmentTypeRaw.self)
                    )
                    upcomingAppointment.append(appointmentDetails)
                }
                return upcomingAppointment
            } catch {
                fatalError("\(error)")
            }
        }
        
        
        func getPastAppointment() async -> [Appointment]{
            do {
                var pastAppointment: [Appointment] = []
                let currentUserId = Auth.auth().currentUser!.uid
                let currentPatient = try await db.collection("Patient").document(currentUserId).getDocument(as: Patient.self)
                for appointmentId in currentPatient.pastAppointments ?? [] {
                    let appointmentRawDetails = try await db.collection("Appointment").document(appointmentId).getDocument(as: AppointmentRaw.self)
                    let appointmentDetails = Appointment(
                        id: appointmentId,
                        appointmentTime: Date(timeIntervalSince1970: TimeInterval(appointmentRawDetails.appointmentTime)),
                        doctor: try await db.collection("Doctor").document(appointmentRawDetails.doctor).getDocument(as: DoctorRaw.self),
                        type: try await db.collection("AppointmentType").document(appointmentRawDetails.type).getDocument(as: AppointmentTypeRaw.self)
                    )
                    pastAppointment.append(appointmentDetails)
                }
                return pastAppointment
            } catch {
                fatalError("\(error)")
            }
        }
        
        func getConsultPastAppointments() async -> [Appointment]{
           
                let pastAppointments =  await getPastAppointment()
                var consultPastAppointments: [Appointment] = pastAppointments.filter({$0.type!.category == "Consultation"})
                return consultPastAppointments
           
        }
        
        func getConsultUpAppointments() async -> [Appointment]{
           
                let upcomingAppointments =  await getUpcomingAppointment()
                var consultUpAppointments: [Appointment] = upcomingAppointments.filter({$0.type!.category == "Consultation"})
                return consultUpAppointments
           
        }
        
//        func getLabPastAppointments() async -> [Appointment]{
//
//                let pastAppointments =  await getPastAppointment()
//                var consultPastAppointments: [Appointment] = pastAppointments.filter({$0.type!.category == "Consultation"})
//                return consultPastAppointments
//
//        }
//
//        func getLabUpAppointments() async -> [Appointment]{
//
//                let upcomingAppointments =  await getUpcomingAppointment()
//                var consultPastAppointments: [Appointment] = pastAppointments.filter({$0.type!.category == "Consultation"})
//                return consultPastAppointments
//
//        }
//
//        func getVaccPastAppointments() async -> [Appointment]{
//
//                let pastAppointments =  await getPastAppointment()
//                var consultPastAppointments: [Appointment] = pastAppointments.filter({$0.type!.category == "Consultation"})
//                return consultPastAppointments
//
//        }
//
//        func getVaccUpAppointments() async -> [Appointment]{
//
//                let upcomingAppointments =  await getUpcomingAppointment()
//                var consultPastAppointments: [Appointment] = pastAppointments.filter({$0.type!.category == "Consultation"})
//                return consultPastAppointments
//
//        }
//
        
        
            
    }
}
