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
        @Published var user: User = User(name: "", email: "", userType: .patient, profileImage: "", mobileNumber: "")
        @Published var patient: PatientRaw = PatientRaw(age: 0, gender: "", bloodGroup: "", height: 0.0, weight: 0.0)
        
        let db = FirebaseConfig().db
        
        init() {
            isLoading = true
            
            guard let currentUserData = UserDefaults.standard.data(forKey: "currentUser") else { fatalError("No Active User!!!") }
            let decoder = JSONDecoder()
            guard let currentUser = try? decoder.decode(User.self, from: currentUserData) else { fatalError("Invalid User!!!") }
            user = currentUser
            
            Task {
               await getProfileInformation()
               isLoading = false
            }
        }
        
        func getProfileInformation() async -> Void {
            do {
                let currentUserId = Auth.auth().currentUser!.uid
                let currentPatient = try await db.collection("Patient").document(currentUserId).getDocument(as: PatientRaw.self)
                patient = currentPatient
            } catch {
                fatalError("\(error)")
            }
        }
        
        
        
        
        
        
    }
    
    
    
}
