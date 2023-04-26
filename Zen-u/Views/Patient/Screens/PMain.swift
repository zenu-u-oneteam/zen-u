//
//  TabBar.swift
//  Zen-u
//
//  Created by Harsh Kelawala on 18/04/23.
//

import SwiftUI

struct PMain: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            PHome()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
            
            PAppointment()
                .tabItem {
                    Label("Appointment", systemImage: "calendar")
                }
                .tag(1)
            
            Text("Third View")
                .tabItem {
                    Label("Records", systemImage: "doc")
                }
                .tag(2)
            
            Text("Fourth View")
                .tabItem {
                    Label("Reminder", systemImage: "bell")
                }
                .tag(3)
        }
        .accentColor(.black)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.large)
    }
}


struct PMain_Previews: PreviewProvider {
    static var previews: some View {
        PMain()
    }
}


