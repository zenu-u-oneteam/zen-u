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
                    Label("Home", systemImage: "house")
                }
                .tag(0)
            
            Text("Staff")
                .tabItem {
                    Label("Patients", systemImage: "person.2.crop.square.stack")
                }
                .tag(1)
            
            Text("Patients")
                .tabItem {
                    Label("Staff", systemImage: "person.2.circle")
                }
                .tag(3)
            AAlerts()
                .tabItem {
                    Label("Alerts", systemImage: "exclamationmark.triangle")
                }
                .tag(4)
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
