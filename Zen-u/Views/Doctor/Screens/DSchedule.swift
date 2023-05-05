//
//  DSchedule.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI

struct DSchedule: View {
    @StateObject var appointmentViewModel: DateViewModel = DateViewModel()

    @State var selectedMonth: Int = DateViewModel().currentMonthValue()
    @State var selectedDate: Int = DateViewModel().currentDateValue()
    @State var currentDate: Date = DateViewModel().currentDay
    @State var currentDateIndex: Int = DateViewModel().currentDateValue()
    @State var datesofMonth : [Date] = DateViewModel().currentMonth
    @State var filterMode: String = "none"
    @StateObject private var viewModel = ViewModel()
    
    let months = ["January", "February", "March" , "April" , "May" , "June" , "July" , "August" , "September" ,"October" , "November" , "December"]

    var body: some View {
        
        NavigationStack{
            VStack {
                ScrollViewReader {
                    value in
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 25) {
                            ForEach(months.indices, id: \.self) {index in
                                Button {
                                    self.selectedMonth = index
                                    self.datesofMonth = appointmentViewModel.fetchRequestedMonth(month: selectedMonth + 1)
                                    currentDateIndex = 0
                                    selectedDate = 0
                                    appointmentViewModel.update()
                                    
                                    value.scrollTo(selectedMonth , anchor: .leading)
                                } label: {
                                    Text(months[index])
                                        .foregroundColor(selectedMonth == index ? Color("Accent") : Color("Subheadings"))
                                        .font(.headline.bold())
                                }
                            }
                        }
                        .frame(height: 20)
                        .padding(.bottom, 8)
                    }.onAppear{
                        value.scrollTo(selectedMonth , anchor: .leading)
                    }
                }
                
                HStack(spacing: 0) {
                    Spacer()
                    ScrollViewReader {
                        value in
                        ScrollView(.vertical) {
                            LazyVStack(alignment: .leading, spacing: 10) {
                                ForEach(datesofMonth.indices, id: \.self){ day in
                                    Button {
                                        self.selectedDate = day
//                                        print("Day \(day)")
//                                        print("selected \(currentDate)")
                                        value.scrollTo(selectedDate , anchor: .top)
                                    } label: {
                                        VStack {
                                            Text(appointmentViewModel.extractDate(date: datesofMonth[day], format: "dd"))
                                                .font(.title2.bold())
                                                .foregroundColor(selectedDate == day ?  .white :
                                                                    Color("Subheadings"))
                                            
                                            Text(appointmentViewModel.extractDate(date: datesofMonth[day] , format: "EEE"))
                                                .font(.callout.weight(.light))
                                                .foregroundColor(selectedDate == day ? .white : Color("Subheadings"))
                                        }
                                        .foregroundColor(Color("Subheadings"))
                                        .frame(width: 50 ,height: 70)
                                    }
                                    .background(selectedDate == day ? Color("Accent") : .white)
                                    .cornerRadius(12)
                                }
                            }
                            .frame(width: 60)
                        }.onAppear{
                            value.scrollTo(currentDateIndex , anchor: .top)
                        }.onChange(of: selectedMonth) { _ in
                            value.scrollTo(selectedDate , anchor: .top)
                        }
                    }
                    
                    Spacer()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        if( viewModel.isLoading ){
                            ProgressView("Loading...").hCenter()
                        }else{
                            LazyVStack (alignment: .leading, spacing: 10){
                                var appList = viewModel.monthAppMap[selectedMonth]?.filter({DateViewModel().getDateValue(date: $0.appointment.appointmentTime) == selectedDate})
                                if appList!.isEmpty {
                                    emptyDisplayMessage(message: "No Scheduled Appointments")
                                }else{
                                    ForEach(appList!.indices, id: \.self) {
                                        index  in
                                        Button {
                                            appointmentViewModel.update()
                                        } label: {
                                            NavigationLink(destination: DAppointmentDetails(appointmentDetails: appList![index])){
                                                
                                                
                                                DScheduleTaskCard(patientName: appList![index].patientUser.name, tags: ["New patient", "OPD"], time: DateViewModel().getTimeFromDate(date: appList![index].appointment.appointmentTime), age: appList![index].appointment.patient?.age ?? -1, gender: appList![index].appointment.patient?.gender ?? "Not available")
                                            }
                                        }
                                    }
                                }
                                
                            }
                        }
                        
                    }
                    .frame(width: 300)
                    Spacer()
                }
                HStack(alignment: .center, spacing: 10) {
                    FilterButton(text: "OPD", selected: $filterMode)
                    FilterButton(text: "Operation", selected: $filterMode)
                    FilterButton(text: "Meeting", selected: $filterMode)
                }
            }
            .padding()
            .navigationTitle("Schedule")
        }
    }
}

struct FilterButton: View {
    var text: String
    @Binding var selected: String
    
    var body: some View {
        Button(action: {
            if (selected == text) {
                selected = "none"
            } else {
                selected = text
            }
        }) {
            Text(text)
                .font(.subheadline.weight(.semibold))
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .frame(minWidth: 110, minHeight: 50)
                .background(selected == text ? Color("Accent") : Color("Heading"))
                .cornerRadius(60)
        }
    }
}

struct DSchedule_Previews: PreviewProvider {
    static var previews: some View {
        DSchedule()
    }
}
