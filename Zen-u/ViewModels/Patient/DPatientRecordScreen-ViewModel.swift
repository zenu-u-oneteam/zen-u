//
//  DPatientRecordScreen-ViewModel.swift
//  Zen-u
//
//  Created by Aakriti Rawat on 03/05/23.
//

import Foundation
import Firebase

extension DPatientRecordScreen{
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
        let db = FirebaseConfig().db
        
        init() {
            isLoading = true
            Task {
                isLoading = false
            }
        }
        
        func addAppointmentReport(symptoms: String, medicalAdvice: String, prescription: String) {
            do {
                let currentUserId = Auth.auth().currentUser!.uid
                let newRecord = db.collection("AppointmentReports").document()
                newRecord.setData([
                    "appointment": "",
                    "appointmentTime": Int(Date().timeIntervalSince1970),
                    "doctor": currentUserId,
                    "symptoms": symptoms,
                    "medicalAdvice": medicalAdvice,
                    "prescription": prescription,
                    "patient": "ohIcsbodlqeSp7nsn3jdQXwp2l83",
                    "type": "IQZJtYfBOZKD0omZ1wdg"
                ])
                print("Appointment Report Added!")
            } catch {
                fatalError("\(error)")
            }
        }
    }
}
