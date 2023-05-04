//
//  DProfile-ViewModel.swift
//  Zen-u
//
//  Created by Harsh Kelawala on 03/05/23.
//

import Foundation
import FirebaseAuth
import Firebase

extension DProfile{
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
        @Published var user: User = User(name: "", email: "", userType: .doctor, profileImage: "", mobileNumber: "")
        @Published var doctor = DoctorRaw(age: 0, gender: "", name: "", startTime: 0, endTime: 0, experience: "", education: "", languages: "", specialisation: "")
        
        let db = FirebaseConfig().db
        
        init() {
            print("Hello")
            isLoading = true
            
            guard let currentUserData = UserDefaults.standard.data(forKey: "currentUser") else { return }
            let decoder = JSONDecoder()
            guard let currentUser = try? decoder.decode(User.self, from: currentUserData) else { return }
            
            user = currentUser
            
            Task {
               await getDoctorInformation()
               isLoading = false
            }
        }
        
        func getDoctorInformation() async -> Void {
            do {
                let currentUserId = Auth.auth().currentUser!.uid
                let currentDoctor = try await db.collection("Doctor").document(currentUserId).getDocument(as: DoctorRaw.self)
                doctor = currentDoctor
                print(doctor)
            } catch {
                fatalError("\(error)")
            }
        }
        
        func editDoctor() {
            print("Edit User")
        }
        
        func doctorSettings() {
            print("Patient Settings")
        }
        
        func logout() {
            do {
                UserDefaults.standard.removeObject(forKey: "currentUser")
                try Auth.auth().signOut()
            } catch {
                print(error)
            }
        }


    }
}
