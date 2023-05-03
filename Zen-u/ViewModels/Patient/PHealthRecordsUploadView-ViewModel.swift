//
//  PHealthRecordsUploadView.swift
//  Zen-u
//
//  Created by Aindrila Ray on 02/05/23.
//

import Foundation
import FirebaseAuth

extension PHealthRecordsUploadView{
    
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
        @Published var healthRecords: [HealthRecord] = []
        @Published var pendingHealthRecords: [PendingHealthRecord] = []
        @Published var appointmentReports: [AppointmentReports] = []
        
        let db = FirebaseConfig().db
        
        init() {
            isLoading = true
            
            Task {
                healthRecords = await getHealthRecords()
                pendingHealthRecords = await getPendingHealthRecords()
                appointmentReports = await getAppointmentReports()
                isLoading = false
            }
        }
        
        
        func getHealthRecords() async ->  [HealthRecord]{
            do {
                var healthRecords: [HealthRecord] = []
                let currentUserId = Auth.auth().currentUser!.uid
                let currentPatient = try await db.collection("Patient").document(currentUserId).getDocument(as: Patient.self)
                for healthRecordId in currentPatient.healthRecords ?? [] {
                    print(healthRecordId)
                    let healthRecordRawDetails = try await db.collection("Health Record").document(healthRecordId).getDocument(as: HealthRecordRaw.self)
                    print(healthRecordRawDetails)
                    let healthRecordDetails = try await HealthRecord(
                        id: healthRecordId,
                        name: healthRecordRawDetails.name ,
                        appointmentTime: Date(timeIntervalSince1970: TimeInterval(healthRecordRawDetails.appointmentTime )),
                        patient: db.collection("Patient").document(healthRecordRawDetails.patient ).getDocument(as: PatientRaw.self),
                        doctor: try await db.collection("Doctor").document(healthRecordRawDetails.doctor ).getDocument(as: DoctorRaw.self),
                        type: try await db.collection("Health Record Type").document(healthRecordRawDetails.type).getDocument(as: HealthRecordTypeRaw.self),
                        document:healthRecordRawDetails.document
                    )
                    
                    healthRecords.append(healthRecordDetails)
                    
                }
                return healthRecords.sorted { $0.appointmentTime > $1.appointmentTime }
                
            } catch {
                fatalError("\(error)")
            }
        }
        
        func getPendingHealthRecords() async ->  [PendingHealthRecord]{
            do{
                
                var pendinghealthRecords: [PendingHealthRecord] = []
                let currentUserId = Auth.auth().currentUser!.uid
                let currentPatient = try await db.collection("Patient").document(currentUserId).getDocument(as: Patient.self)
                for healthRecordId in currentPatient.pendingHealthRecords ?? [] {
                    let healthRecordRawDetails = try await db.collection("PendingHealthRecords").document(healthRecordId).getDocument(as: PendingHealthRecordRaw.self)
                    print(healthRecordRawDetails)
                    let healthRecordDetails = try await PendingHealthRecord(
                        id: healthRecordId,
                        name: healthRecordRawDetails.name,
                        appointmentTime: Date(timeIntervalSince1970: TimeInterval(healthRecordRawDetails.appointmentTime)),
                        patient: db.collection("Patient").document(healthRecordRawDetails.patient).getDocument(as: PatientRaw.self),
                        doctor: try await db.collection("Doctor").document(healthRecordRawDetails.doctor).getDocument(as: DoctorRaw.self),
                        type: try await db.collection("Health Record Type").document(healthRecordRawDetails.type).getDocument(as: HealthRecordTypeRaw.self)
                    )
                    
                    pendinghealthRecords.append(healthRecordDetails)
                    
                }
                return pendinghealthRecords.sorted { $0.appointmentTime > $1.appointmentTime }
                
            } catch {
                fatalError("\(error)")
            }
        }
        
        func getAppointmentReports() async ->  [AppointmentReports]{
            do {
                
                var appointmentReports: [AppointmentReports] = []
                let currentUserId = Auth.auth().currentUser!.uid
                let currentPatient = try await db.collection("Patient").document(currentUserId).getDocument(as: Patient.self)
                for healthRecordId in currentPatient.appointmentReports ?? [] {
                    let appointmentReportsRawDetails = try await db.collection("AppointmentReports").document(healthRecordId).getDocument(as: AppointmentReportsRaw.self)
                    print(appointmentReportsRawDetails)
                    let AppointmentReportsDetails = try await AppointmentReports(
                        id: healthRecordId,
                        appointment: db.collection("Appointment").document(appointmentReportsRawDetails.appointment).getDocument(as: AppointmentRaw.self),
                        appointmentTime: Date(timeIntervalSince1970: TimeInterval(appointmentReportsRawDetails.appointmentTime)),
                        patient: db.collection("Patient").document(appointmentReportsRawDetails.patient).getDocument(as: PatientRaw.self),
                        doctor: try await db.collection("Doctor").document(appointmentReportsRawDetails.doctor).getDocument(as: DoctorRaw.self),
                        type: try await db.collection("Health Record Type").document(appointmentReportsRawDetails.type).getDocument(as: HealthRecordTypeRaw.self),
                        symptoms: appointmentReportsRawDetails.symptoms,
                        medicalAdvice: appointmentReportsRawDetails.medicalAdvice
                    )
                    
                    appointmentReports.append(AppointmentReportsDetails)
                    
                }
                return appointmentReports.sorted { $0.appointmentTime > $1.appointmentTime }
                
            } catch {
                fatalError("\(error)")
            }
        }
    }
}
