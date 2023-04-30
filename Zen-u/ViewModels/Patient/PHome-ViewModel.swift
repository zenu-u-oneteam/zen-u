//
//  PHome.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 29/04/23.
//

import Foundation
import FirebaseAuth

extension PHome {
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
        @Published var userName: String = ""
        @Published var greeting: String = ""
        @Published var upcomingAppointments: [String] = []
        
        let db = FirebaseConfig().db
        
        init() {
            isLoading = true
            
            guard let currentUserData = UserDefaults.standard.data(forKey: "currentUser") else { fatalError("No Active User!!!") }
            let decoder = JSONDecoder()
            guard let currentUser = try? decoder.decode(User.self, from: currentUserData) else { fatalError("Invalid User!!!") }
            userName = currentUser.name
            
            greeting = setGreeting()
            
            Task {
                upcomingAppointments = await getUpcomingAppointment()
                isLoading = false
            }
        }
        
        func setGreeting() -> String {
            let hour = Calendar.current.component(.hour, from: Date())
            
            let newDay = 0
            let noon = 12
            let sunset = 18
            let midnight = 24
            
            var greetingText = "Hello"
            
            switch hour {
            case newDay..<noon:
                greetingText = "Good Morning"
            case noon..<sunset:
                greetingText = "Good Afternoon"
            case sunset..<midnight:
                greetingText = "Good Evening"
            default:
                greetingText = "Hello"
            }
            
            return greetingText
        }
        
        func getUpcomingAppointment() async -> [String]{
            do {
                let currentUserId = Auth.auth().currentUser!.uid
                let currentPatient = try await db.collection("Patient").document(currentUserId).getDocument(as: Patient.self)
                return currentPatient.appointments!
            } catch {
                fatalError("\(error)")
            }
        }
    }
}
