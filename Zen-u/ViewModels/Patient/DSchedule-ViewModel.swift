//
//  DSchedule-ViewModel.swift
//  Zen-u
//
//  Created by Tanvi Gupta on 03/05/23.
//

import Foundation
import FirebaseAuth

extension DSchedule {
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
        @Published var appList : [AppointmentData] = []
        @Published var monthAppMap : [Int : [AppointmentData]] = [:]
        
        
        let db = FirebaseConfig().db
        init(){
            isLoading = true
            Task{
                appList = await getAppointmentList()
                monthAppMap = await getMonthAppMap()
                isLoading = false
            }
            
        }
        func getAppointmentList() async -> [AppointmentData] {
            do {
                var appList : [AppointmentData] = []
                let currentUserId = Auth.auth().currentUser!.uid
                let currentDoctor = try await db.collection("Doctor").document(currentUserId).getDocument(as: DoctorRaw.self)
                for appointmentId in currentDoctor.appointments ?? [] {
                    let appointmentRawDetails = try await db.collection("Appointment").document(appointmentId).getDocument(as: AppointmentRaw.self)
                    let appointmentDetails = Appointment(
                        id: appointmentId,
                        appointmentTime: Date(timeIntervalSince1970: TimeInterval(appointmentRawDetails.appointmentTime)),
                        patient : try await db.collection("Patient").document(appointmentRawDetails.patient).getDocument(as: PatientRaw.self),
                        doctor: try await db.collection("Doctor").document(appointmentRawDetails.doctor).getDocument(as: DoctorRaw.self),
                        type: try await db.collection("AppointmentType").document(appointmentRawDetails.type).getDocument(as: AppointmentTypeRaw.self)
                    )
                    let patientDetails = try await db.collection("Users").document(appointmentRawDetails.patient).getDocument(as: User.self)
                    appList.append(AppointmentData(appointment: appointmentDetails, patientUser: patientDetails))
                    
                }
                return appList.sorted { $0.appointment.appointmentTime < $1.appointment.appointmentTime }
            }catch{
                fatalError("\(error)")
            }
            
        }
        
        func getMonthAppMap()  async -> [Int : [AppointmentData]] {
            var monthAppMap : [Int : [AppointmentData]] = [:]
            var appList : [AppointmentData] = await getAppointmentList()
            for i in 0...11 {
                var filterList : [AppointmentData] = appList.filter({ DateViewModel().getMonthValue(date: $0.appointment.appointmentTime) == i })
                monthAppMap[i]=filterList
            }
            return monthAppMap
        }
    }
}

struct AppointmentData {
    var appointment : Appointment
    var patientUser : User
}
