//
//  PProfile-View Model.swift
//  Zen-u
//
//  Created by Aindrila Ray on 01/05/23.
//

import Foundation
import FirebaseAuth
import Firebase

extension ProfileHeaderView{
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
        @Published var userName: String = ""
        @Published var userPhoneNumber: String = ""
        @Published var userEmail: String = ""
        @Published var userProfileImage: String = ""
        @Published var patientName : String = ""
        @Published var patientAge: Int = 0
        @Published var patientBloodGroup: String = ""
        @Published var patientGender: String = ""
        @Published var patientWeight: Float = 0.0
        @Published var patientHeight: Float = 0.0
        
        let db = FirebaseConfig().db
        
        init() {
            isLoading = true
            
            guard let currentUserData = UserDefaults.standard.data(forKey: "currentUser") else { fatalError("No Active User!!!") }
            let decoder = JSONDecoder()
            guard let currentUser = try? decoder.decode(User.self, from: currentUserData) else { fatalError("Invalid User!!!") }
            userName = currentUser.name
            
            
            Task {
               await getProfileInformation()
               isLoading = false
            }
        }
        
        func getProfileInformation() async -> Void {
            do {
                
                let currentUserId = Auth.auth().currentUser!.uid
                let currentPatient = try await db.collection("Patient").document(currentUserId).getDocument(as: Patient.self)
                let currentUser = try await db.collection("Users").document(currentUserId).getDocument(as: User.self)
                let PatientDetails = try await db.collection("Patient").document(currentUserId).getDocument(as: PatientRaw.self)
                userEmail = currentUser.email
                userPhoneNumber = currentUser.mobileNumber
                userProfileImage = currentUser.profileImage
                patientName = currentUser.name
                patientBloodGroup = PatientDetails.bloodGroup
                patientAge = PatientDetails.age
                patientGender = PatientDetails.gender
                patientWeight = PatientDetails.weight
                patientHeight = PatientDetails.height
                return
            } catch {
                fatalError("\(error)")
            }
        }
        
        
        
        
        
        
    }
    
    
    
}
