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
    @StateObject private var viewModel = ViewModel()
    
    let appointmentDetails: Appointment = Appointment(id: "12345", appointmentTime: Date(), doctor: DoctorRaw(age: 45, gender: "Male", name: "Dr. Hanna Fiegel"), type: AppointmentTypeRaw(name: "PSV23 (Pneumo)", amount: 123, category: "General", department: "General"))
    
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
                        if viewModel.isLoading {
                            
                            ProgressView("Loading...").hCenter()
                            
                        } else{
                            if statusIndex == 0 {
                                ForEach(viewModel.upcomingAppointments.indices, id: \.self){ index in
                                    AppointmentCard(appointmentDetails: viewModel.upcomingAppointments[index])
                                }
                            }
                            else {
                                ForEach(viewModel.pastAppointments.indices, id: \.self){ index in
                                    AppointmentCard(appointmentDetails: viewModel.pastAppointments[index])
                                }
                            }
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
            .padding(20)
        }
        .accentColor(Color("Accent"))
    }
}

struct PAppointment_Previews: PreviewProvider {
    static var previews: some View {
        PAppointment()
    }
}
