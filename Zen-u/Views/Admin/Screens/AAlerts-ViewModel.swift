//
//  AAlerts-ViewModel.swift
//  Zen-u
//
//  Created by Ta/Users/prakharsingh/Documents/zen-u/Zen-u/Views/Admin/Screens/AAlerts-ViewModel.swiftnvi Gupta on 04/05/23.
//

import Foundation
import FirebaseAuth
import SwiftUI


extension AAlerts {
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
        @Published var alertList : [AlertModelMy] = []
        @Published var resolvedalertList : [AlertModelMy] = []
        @Published var unResolvedalertList : [AlertModelMy] = []
        let db = FirebaseConfig().db
        @State var refresh: Bool = false
        
        init() {
            isLoading = true
            Task{
                alertList = await getAlertList()
                resolvedalertList = await getResolvedList()
                unResolvedalertList = await getUnResolvedList()
                isLoading = false
            }
        }
        func update() {
            isLoading = true
            Task{
                alertList = await getAlertList()
                resolvedalertList = await getResolvedList()
                unResolvedalertList = await getUnResolvedList()
                isLoading = false
            }
         }

        func getAlertList() async -> [AlertModelMy] {
            do {
                var alertList : [AlertModelMy] = []
                let refDoc = try await db.collection("Alerts").getDocuments()
                for alert in refDoc.documents {
                    let jsonData = try JSONSerialization.data(withJSONObject: alert.data(), options: .prettyPrinted)
                    let alertData = try JSONDecoder().decode(AlertRaw.self, from: jsonData)
                    let alertFinal = AlertModelMy(id: alertData.id , code: alertData.code, datetime: Date(timeIntervalSince1970: TimeInterval(alertData.datetime)), description: alertData.description, isResolved: alertData.isResolved)
                    alertList.append(alertFinal)
                }
                return alertList

            }catch {
                fatalError("\(error)")
            }
            
        }
        func getResolvedList () async -> [AlertModelMy]{
           
            let allalerts =  await getAlertList()
            var resolvedAlerts : [AlertModelMy] = allalerts.filter({$0.isResolved == true })
            return resolvedAlerts.sorted (by: { $0.datetime > $1.datetime })
           
        }
        
        func getUnResolvedList () async -> [AlertModelMy]{
           
            let allalerts =  await getAlertList()
            var unresolvedAlerts : [AlertModelMy] = allalerts.filter({$0.isResolved == false })
            return unresolvedAlerts.sorted (by: { $0.datetime > $1.datetime })
           
        }
        
        func setAsResolved(id : String) async {
            do {
                try await db.collection("Alerts").document(id).updateData(["isResolved": true ])
            }catch {
                print(error)
            }
            
        }
    }
}


//struct AlertList: Hashable, Codable, Identifiable {
//    var id: String?
//    var altertlist
//}
