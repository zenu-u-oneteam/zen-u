//
//  SignupPage-ViewModel.swift
//  Zen-u
//
//  Created by Aakriti Rawat on 04/05/23.
//

import Foundation
import FirebaseAuth

extension SignupPage{
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
        
        @Published var user: User = User(name: "", email: "", userType: .patient, profileImage: "", mobileNumber: "")
        @Published var password = ""

        @Published var canContinue = false
//        @Published private var records = []
        
        let db = FirebaseConfig().db
        
        init() {
            isLoading = true
//            Task {
//                isLoading = false
//            }
        }
        
        func addingUser(){
            do {
                let newUser = db.collection("Users").document()
                newUser.setData([
                    "name": user.name,
                    "email": user.email
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
