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
        
        let db = FirebaseConfig().db
        
        init() {
            isLoading = true
            
            guard let currentUserData = UserDefaults.standard.data(forKey: "currentUser") else { fatalError("No Active User!!!") }
            let decoder = JSONDecoder()
            guard let currentUser = try? decoder.decode(User.self, from: currentUserData) else { fatalError("Invalid User!!!") }
            
            
            
            
            Task {
                healthRecords = await getHealthRecords()
                pendingHealthRecords = await getPendingHealthRecords()
                isLoading = false
            }
        }
        
        
        func getHealthRecords() async ->  [HealthRecord]{
            do{
                
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
                return healthRecords
                
            }catch {
                print(error)
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
                return pendinghealthRecords

            }catch {
                fatalError("\(error)")
            }
        }
        
        
        
        
        
    }
}
