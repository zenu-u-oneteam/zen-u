//
//  PHome.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 29/04/23.
//

import Foundation

extension PHome {
    @MainActor class ViewModel: ObservableObject {
        @Published var userName: String = ""
        @Published var greeting: String = "Hello"
        
        init() {
            if let currentUserData = UserDefaults.standard.data(forKey: "currentUser") {
                let decoder = JSONDecoder()
                if let currentUser = try? decoder.decode(User.self, from: currentUserData) {
                    userName = currentUser.name
                }
            }
            greeting = setGreeting()
        }
        
        private func setGreeting() -> String {
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
    }
}
