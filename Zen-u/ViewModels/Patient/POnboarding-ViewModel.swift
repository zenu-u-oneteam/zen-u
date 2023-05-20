//
//  POnboarding-ViewModel.swift
//  Zen-u
//
//  Created by Aakriti Rawat on 02/05/23.
//

import Foundation
import Firebase
import FirebaseAuth

extension POnboarding {
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
        
        @Published var patient: PatientRaw = PatientRaw(age: 0, gender: "Male", bloodGroup: "A+", height: 0, weight: 0)
        @Published var user: UserRaw = UserRaw(name: "", email: "", userType: "Patient", profileImage: "", mobileNumber: "")
        @Published var dateOfBirth = Date()
        @Published var aadhaar = ""
        @Published var height = ""
        @Published var weight = ""
        @Published var canContinue = false
        
        let calendar = Calendar.current
        let db = FirebaseConfig().db
        
        init(userName: String, email: String) {
            user.name = userName
            user.email = email
            user.profileImage = "https://pbs.twimg.com/profile_images/1276567411240681472/8KdXHFdK_400x400.jpg"
            patient.name = userName
        }
        
        func addingPatient() {
            do {
                let currentUserId = Auth.auth().currentUser!.uid
                patient.age = calendar.dateComponents([.year], from: dateOfBirth, to: Date()).year!
                patient.height = Float(height)!
                patient.weight = Float(weight)!
                patient.aadhaar = aadhaar
                print(user)
                print(patient)
                try db.collection("Users").document(currentUserId).setData(from: user)
                try db.collection("Patient").document(currentUserId).setData(from: patient)
                print("Patient Created!")
                let encoder = JSONEncoder()
                if let currentUserData = try? encoder.encode(user) {
                    UserDefaults.standard.set(currentUserData, forKey: "currentUser")
                }
                canContinue = true
            } catch {
                fatalError("\(error)")
            }
        }
    }
}
