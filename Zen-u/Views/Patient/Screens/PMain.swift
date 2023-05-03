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
            
            PHealthRecords(tableHeadings: [
                HealthRecordType(id: "1", title: "Appointment Reports", category: .appointmentRecords, image: "stethoscope.circle.fill" , description: "All your details in one place"),
                HealthRecordType(id: "2", title: "Lab Reports", category: .labreports, image: "doc.circle.fill" , description: "All your details in one place"),
                HealthRecordType(id: "3", title: "Vaccination Reports", category: .vaccinationreports, image: "syringe.fill" , description: "All your details in one place"),
                HealthRecordType(id: "4", title: "Hospitalizations", category: .hospitalization, image: "bed.double.circle.fill" , description: "All your details in one place")
            ])
            .tabItem {
                Label("Records", systemImage: "doc")
            }
            .tag(2)
            
            PReminders()
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


