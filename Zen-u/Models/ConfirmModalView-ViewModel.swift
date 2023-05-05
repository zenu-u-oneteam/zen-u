//
//  ConfirmModalView-ViewModel.swift
//  Zen-u
//
//  Created by Tanvi Gupta on 04/05/23.
//

import Foundation
import FirebaseAuth

extension ConfirmModalView {
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
        
        
        let db = FirebaseConfig().db
        
        func sendAlert(code: String , desc : String ) async {
            do {
                isLoading = true
                let billId = makeid(length: 35)
                let alert = AlertRaw(id: billId , code: code, datetime: Int(Date().timeIntervalSince1970), description: desc, isResolved: false)
                try db.collection("Alerts").document(billId).setData(from: alert)
                isLoading = false
            }catch{
                print(error)
            }
           
        }
        
        
        
        
        
    }
}
