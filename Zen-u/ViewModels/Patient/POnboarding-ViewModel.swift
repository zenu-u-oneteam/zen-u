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
            Task {
                isLoading = false
            }
        }
        
        func newPatient(){
            do {
                newPatient = db.collection("Patient")
                
                print("User Created!")
                
            } catch {
                fatalError("\(error)")
            }
        }
        
        
    }
}
