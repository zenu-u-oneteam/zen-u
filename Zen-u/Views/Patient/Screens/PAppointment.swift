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
                            if typeIndex == 0 {
                                if statusIndex == 0 {
                                    if viewModel.upcomingAppointments.isEmpty{
                                        emptyDisplayMessage(message: "No Upcoming Appointments")
                                    }else{
                                        ForEach(viewModel.upcomingAppointments.indices, id: \.self){ index in
                                            AppointmentCard(appointmentDetails: viewModel.upcomingAppointments[index])
                                        }
                                    }
                                    
                                }
                                else {
                                    if viewModel.pastAppointments.isEmpty{
                                        emptyDisplayMessage(message: "No Past Records")
                                    }else{
                                        ForEach(viewModel.pastAppointments.indices, id: \.self){ index in
                                            AppointmentCard(appointmentDetails: viewModel.pastAppointments[index])
                                        }
                                    }
                                    
                                }
                            }
                            else if typeIndex == 1 {
                                if statusIndex == 0 {
                                    if viewModel.vaccUpAppointments.isEmpty{
                                        emptyDisplayMessage(message: "No Upcoming Vaccinations")
                                    }else{
                                        ForEach(viewModel.vaccUpAppointments.indices, id: \.self){ index in
                                            AppointmentCard(appointmentDetails: viewModel.vaccUpAppointments[index])
                                        }
                                    }
                                    
                                }
                                else {
                                    if viewModel.vaccPastAppointments.isEmpty{
                                        emptyDisplayMessage(message: "No Past Records")
                                    }else{
                                        ForEach(viewModel.vaccPastAppointments.indices, id: \.self){ index in
                                            AppointmentCard(appointmentDetails: viewModel.vaccPastAppointments[index])
                                        }
                                    }
                                    
                                }
                            }
                            else if typeIndex == 2 {
                                if statusIndex == 0 {
                                    if viewModel.consultUpAppointments.isEmpty {
                                        emptyDisplayMessage(message: "No Upcoming Consultations")
                                    }else{
                                        ForEach(viewModel.consultUpAppointments.indices, id: \.self){ index in
                                            AppointmentCard(appointmentDetails: viewModel.consultUpAppointments[index])
                                        }
                                    }
                                    
                                }
                                else {
                                    if viewModel.consultPastAppointments.isEmpty{
                                        emptyDisplayMessage(message: "No Past Records")
                                    }else{
                                        ForEach(viewModel.consultPastAppointments.indices, id: \.self){ index in
                                            AppointmentCard(appointmentDetails: viewModel.consultPastAppointments[index])
                                        }
                                    }
                                    
                                }
                            }
                            else if typeIndex == 3 {
                                if statusIndex == 0 {
                                    if viewModel.labUpAppointments.isEmpty{
                                        emptyDisplayMessage(message: "No Upcoming Lab Tests")
                                    }else{
                                        ForEach(viewModel.labUpAppointments.indices, id: \.self){ index in
                                            AppointmentCard(appointmentDetails: viewModel.labUpAppointments[index])
                                        }
                                    }
                                    
                                }
                                else {
                                    if viewModel.labPastAppointments.isEmpty{
                                        emptyDisplayMessage(message: "No Past Records")
                                    }else{
                                        ForEach(viewModel.labPastAppointments.indices, id: \.self){ index in
                                            AppointmentCard(appointmentDetails: viewModel.labPastAppointments[index])
                                        }
                                    }
                                    
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
struct emptyDisplayMessage: View {
    @State var message : String
    var body: some View {
        Text(message).opacity(0.3).frame(width: .infinity , height: 400 ).hCenter()
    }
}
struct PAppointment_Previews: PreviewProvider {
    static var previews: some View {
        PAppointment()
    }
}
