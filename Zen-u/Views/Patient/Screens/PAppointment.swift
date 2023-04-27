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
    @State private var book: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
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
                VStack {
                    if book == true {
                        Button(action: {book = true}) {
                            Image.init(systemName: "plus")
                                .font(.title2)
                                .frame(width: 50, height: 50)
                                .background(Color("Accent"))
                                .foregroundColor(Color.white)
                                .cornerRadius(25)
                        }
                        Button(action: {book = true}) {
                            Image.init(systemName: "plus")
                                .font(.title2)
                                .frame(width: 50, height: 50)
                                .background(Color("Accent"))
                                .foregroundColor(Color.white)
                                .cornerRadius(25)
                        }
                        Button(action: {book = true}) {
                            Image.init(systemName: "plus")
                                .font(.title2)
                                .frame(width: 50, height: 50)
                                .background(Color("Accent"))
                                .foregroundColor(Color.white)
                                .cornerRadius(25)
                        }
                        Button(action: {book = false}) {
                            Image.init(systemName: "multiply")
                                .font(.title2)
                                .frame(width: 50, height: 50)
                                .background(Color("Secondary"))
                                .foregroundColor(Color("Heading"))
                                .cornerRadius(25)
                        }
                    } else {
                        Button(action: {book = true}) {
                            Image.init(systemName: "plus")
                                .font(.title2)
                                .frame(width: 50, height: 50)
                                .background(Color("Accent"))
                                .foregroundColor(Color.white)
                                .cornerRadius(25)
                        }
                    }
                }
                
            }
            .padding()
        }
        .accentColor(Color("Accent"))
    }
}

struct PAppointment_Previews: PreviewProvider {
    static var previews: some View {
        PAppointment()
    }
}
