//
//  AMain.swift
//  Zen-u
//
//  Created by Harsh Kelawala on 02/05/23.
//

import SwiftUI

struct AMain: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            AHome()
                .tabItem {
                    Label("Dashboard", systemImage: "list.dash")
                }
                .tag(0)
            
            Text("Staff")
                .tabItem {
                    Label("Staff", systemImage: "person.text.rectangle")
                }
                .tag(1)
            
            Text("Patients")
                .tabItem {
                    Label("Patients", systemImage: "doc.text.below.ecg")
                }
                .tag(3)
            AAlerts()
                .tabItem {
                    Label("Alerts", systemImage: "exclamationmark.triangle")                }
                .tag(3)
        }
        .accentColor(.black)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.large)
    }
}

struct AMain_Previews: PreviewProvider {
    static var previews: some View {
        AMain()
    }
}
