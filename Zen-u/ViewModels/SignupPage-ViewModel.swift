//
//  SignupPage-ViewModel.swift
//  Zen-u
//
//  Created by Aakriti Rawat on 04/05/23.
//

import Foundation
import FirebaseAuth

extension SignupPage {
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
        @Published var userName: String = ""
        @Published var email: String = ""
        @Published var password: String = ""
        
        @Published var canContinue = false
        
        let db = FirebaseConfig().db
                
        func addingUser(){
            Auth.auth().createUser(withEmail: email, password: password)
            print("User Created!")
            canContinue = true
        }
    }
}
