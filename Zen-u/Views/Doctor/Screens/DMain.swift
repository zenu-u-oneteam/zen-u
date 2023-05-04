//
//  DMain.swift
//  Zen-u
//
//  Created by Harsh Kelawala on 02/05/23.
//

import SwiftUI

struct DMain: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
           DHome()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
            
            DSchedule()
                .tabItem {
                    Label("Schedule", systemImage: "calendar")
                }
                .tag(1)
            DColorAlert()
                .tabItem {
                    Label("Alerts", systemImage: "exclamationmark.triangle")
                }
                .tag(3)
        }
        .accentColor(.black)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.large)
    }
}


struct DMain_Previews: PreviewProvider {
    static var previews: some View {
        DMain()
    }
}
