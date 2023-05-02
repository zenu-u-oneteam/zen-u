//
//  POnboarding-ViewModel.swift
//  Zen-u
//
//  Created by Aakriti Rawat on 02/05/23.
//

import Foundation
import FirebaseAuth

extension POnboarding{
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
        @Published var userName: String = ""
        @Published var greeting: String = ""
        @Published var upcomingAppointments: [Appointment] = []
        
        let db = FirebaseConfig().db
        
        init() {
            isLoading = true
            
            guard let currentUserData = UserDefaults.standard.data(forKey: "currentUser") else { fatalError("No Active User!!!") }
            let decoder = JSONDecoder()
            guard let currentUser = try? decoder.decode(User.self, from: currentUserData) else { fatalError("Invalid User!!!") }
            userName = currentUser.name
            
            
            Task {
                isLoading = false
            }
        }
        
        func sendPatientInfo() async -> String {
            do {
//                newPatient = db.collection("Patient")
                
                return "User Updated!"
                
            } catch {
                fatalError("\(error)")
            }
        }
        
        
    }
}
