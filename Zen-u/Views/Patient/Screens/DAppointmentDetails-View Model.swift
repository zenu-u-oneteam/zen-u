//
//  DAppointmentDetails-View Model.swift
//  Zen-u
//
//  Created by Aindrila Ray on 04/05/23.
//

import Foundation
import FirebaseAuth

extension DAppointmentDetails {
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
        @Published var patientRecords : [HealthRecord] = []
        @Published var appointmentReports : [AppointmentReports] = []
        @Published var activeMedications : [String] = []
        @Published var firstLabReport: HealthRecord = HealthRecord(id: "", name: "", appointmentTime: Date.now, document: "")
        @Published var firstVaccinationReport: HealthRecord = HealthRecord(id: "", name: "", appointmentTime: Date.now, document: "")
        var appointmentDetails: AppointmentData
        
        let db = FirebaseConfig().db
        
        init(appointmentDetails: AppointmentData) {
            isLoading = true
            self.appointmentDetails = appointmentDetails
            Task {
                patientRecords = await getPatientRecords()
                activeMedications = await getactiveMedications()
                appointmentReports = await getAppointmentReports()
                firstLabReport = await getfirstLabReport(record: patientRecords)
                firstVaccinationReport = await getfirstVaccinationReport(record: patientRecords)
                isLoading = false
                
            }
        }
        
        func getfirstLabReport(record: [HealthRecord]) async -> HealthRecord {
                if let index = record.firstIndex(where: { $0.type?.category == "Lab Reports" }) {
                    return record[index]
                } else {
                    return HealthRecord(id: "", name: "", appointmentTime: Date.now, document: "")
                }
                
           
            
        }
        
        func getfirstVaccinationReport(record: [HealthRecord]) async -> HealthRecord {
                if let index = record.firstIndex(where: { $0.type?.category == "Vaccination Reports" }) {
                    return record[index]
                } else {
                    return HealthRecord(id: "", name: "", appointmentTime: Date.now, document: "")
                }
                
           
            
        }
        
        func getPatientRecords() async -> [HealthRecord]  {
            do{
                var healthRecords: [HealthRecord] = []
                let currentPatient = try await db.collection("Patient").document(appointmentDetails.patientUser.id ?? "ohIcsbodlqeSp7nsn3jdQXwp2l83").getDocument(as: Patient.self)
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
        func getAppointmentReports() async -> [AppointmentReports]  {
            do{
                var healthRecords: [AppointmentReports] = []
                let currentPatient = try await db.collection("Patient").document(appointmentDetails.patientUser.id ?? "ohIcsbodlqeSp7nsn3jdQXwp2l83").getDocument(as: Patient.self)
                for healthRecordId in currentPatient.appointmentReports ?? [] {
                    print(healthRecordId)
                    let healthRecordRawDetails = try await db.collection("AppointmentReports").document(healthRecordId).getDocument(as: AppointmentReportsRaw.self)
                    print(healthRecordRawDetails)
                    let healthRecordDetails = try await AppointmentReports(
                        id: healthRecordId,
                        appointmentTime: Date(timeIntervalSince1970: TimeInterval(healthRecordRawDetails.appointmentTime )),
                        patient: db.collection("Patient").document(healthRecordRawDetails.patient ).getDocument(as: PatientRaw.self),
                        doctor: try await db.collection("Doctor").document(healthRecordRawDetails.doctor ).getDocument(as: DoctorRaw.self),
                        type: try await db.collection("Health Record Type").document(healthRecordRawDetails.type).getDocument(as: HealthRecordTypeRaw.self),
                        symptoms: healthRecordRawDetails.symptoms,
                        medicalAdvice: healthRecordRawDetails.medicalAdvice,
                        prescriptions: healthRecordRawDetails.prescriptions ?? "Prozac (1x a day"
                    )
                    
                    healthRecords.append(healthRecordDetails)
                    
                }
                return healthRecords.sorted { $0.appointmentTime > $1.appointmentTime }
                
            } catch {
                fatalError("\(error)")
                
            }
        }
        
        
        func getactiveMedications() async -> [String]  {
            do{
                var activeMedications: [String] = []
                let currentPatient = try await db.collection("Patient").document(appointmentDetails.patientUser.id ?? "ohIcsbodlqeSp7nsn3jdQXwp2l83").getDocument(as: Patient.self)
                activeMedications = currentPatient.medications ?? ["Zoloft","Prozac", "Aspirin"]
                return activeMedications
                
            } catch {
                fatalError("\(error)")
                
            }
            
        }
        
        
        
    }
}




