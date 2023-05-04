//
//  POnboarding-ViewModel.swift
//  Zen-u
//
//  Created by Aakriti Rawat on 02/05/23.
//

import Foundation
import Firebase
import FirebaseAuth

extension POnboarding{
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
        
        @Published var patient: Patient = Patient(age: 1, gender: .male, bloodGroup: "A+", height: 0, weight: 0)
        @Published var user: User = User(name: "", email: "", userType: .patient, profileImage: "", mobileNumber: "")
        @Published var dateOfBirth =  Date()
        @Published var aadhaar = ""
        @Published var height = ""
        @Published var weight = ""
        @Published var canContinue = false

//        @Published private var records = []
        
        let db = FirebaseConfig().db
        
        init() {
            isLoading = true
//            Task { 
//                isLoading = false
//            }
        }
        
        func addingPatient(){
            do {
                let currentUserId = Auth.auth().currentUser!.uid
                let newPatient = db.collection("Patient").document(currentUserId)
                let newUser = db.collection("Users").document(currentUserId)
                
                newUser.setData([
                    "mobileNumber":user.mobileNumber,
                    "userType": user.userType
                ])
                
                newPatient.setData([
                    "age": Calendar.current.dateComponents([.year], from: dateOfBirth, to: Date()).year!,
                    "bloodGroup": patient.bloodGroup,
                    "gender": patient.gender,
                    "height": Float(height)!,
                    "weight": Float(weight)!,
                    "aadhaar": aadhaar
                ])
                
                print("User Created!")
                canContinue = true
            }
//            catch {
//                fatalError("\(error)")
//            }
        }
        
    }
}
