//
//  PAppointment.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 23/04/23.
//

import SwiftUI

struct PAppointment: View {
    @State var statusIndex: Int = 0
    var statusSelections: [String] = ["Upcoming", "Past"]
    @State var typeIndex: Int = 0
    var typeSelections: [String] = ["All", "Vaccinations", "Consultations", "Lab Tests"]
    @State private var favoriteColor = 0
    var appointments: [Int] = [0, 1]
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                SegmentedPicker($statusIndex, selections: statusSelections)
                
                Menu {
                    ForEach(typeSelections.indices, id: \.self) {type in
                        Button(typeSelections[type], action: {typeIndex = type})
                    }
                } label: {
                    ViewButton(text: typeSelections[typeIndex], rIcon: "chevron.down")
                }
                
                ScrollView {
                    ForEach(appointments.indices, id: \.self) {appointment in
                        AppointmentCard(name: "PSV23 (Pneumo)", tags: ["Live", "General"], time: "9:30", doctorName: "Dr. Hanna Fiegel")
                            .padding(.bottom, 10)
                        AppointmentCard(name: "PSV23 (Pneumo)", tags: ["General"], time: "9:30", doctorName: "Dr. Hanna Fiegel")
                            .padding(.bottom, 10)
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Booked Appointments")
            .padding()
        }
    }
}

struct PAppointment_Previews: PreviewProvider {
    static var previews: some View {
        PAppointment()
    }
}
