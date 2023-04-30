//
//  DSchedule.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI

struct DSchedule: View {
    @StateObject var appointmentViewModel: ViewModel = ViewModel()


    @State var selectedMonth: Int = ViewModel().currentMonthValue()
    @State var selectedDate: Int = 0
    @State var currentDate: Date = ViewModel().currentDay
    @State var currentDateIndex: Int = ViewModel().currentDateValue()
    @State var datesofMonth : [Date] = ViewModel().currentMonth
    @State var filterMode: String = "none"
    @State var displayList : [DocAppointment] = CustomDocData().appointmentList
    @State var appliedFilter : Filter = Filter.none
    
    

    
    let months = ["January", "February", "March" , "April" , "May" , "June" , "July" , "August" , "September" ,"October" , "November" , "December"]

    
//    init(){
//        displayList = appList
//        opdAppList = appList.filter({ $0.docAppointmentType == .opd})
//        operationAppList = appList.filter({ $0.docAppointmentType == .opd})
//        meetAppList = appList.filter({ $0.docAppointmentType == .opd})
//    }
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollViewReader {
                    value in
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 25) {
                            ForEach(months.indices, id: \.self) {index in
                                Button {
                                    self.selectedMonth = index
                                    self.datesofMonth = appointmentViewModel.fetchRequestedMonth(month: selectedMonth + 1)
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
                                                .foregroundColor(selectedDate == day || currentDateIndex == day ?  .white :
                                                                    Color("Subheadings"))
                                            
                                            Text(appointmentViewModel.extractDate(date: datesofMonth[day] , format: "EEE"))
                                                .font(.callout.weight(.light))
                                                .foregroundColor(selectedDate == day || currentDateIndex == day ? .white : Color("Subheadings"))
                                        }
                                        .foregroundColor(Color("Subheadings"))
                                        .frame(width: 50 ,height: 70)
                                    }
                                    .background(selectedDate == day || currentDateIndex == day ? Color("Accent") : .white)
                                    .cornerRadius(12)
                                }
                            }
                            .frame(width: 60)
                        }.onAppear{
                            value.scrollTo(currentDateIndex , anchor: .top)
                        }.onChange(of: selectedMonth) { _ in
                            value.scrollTo(0 , anchor: .top)
                        }
                    }
                    
                    Spacer()
                    
                    ScrollView(.vertical) {
                        LazyVStack (alignment: .leading, spacing: 10){
                            ForEach(displayList.indices, id: \.self) {
                                index in
                                
                                    DScheduleTaskCard(patientName: displayList[index].patient.name, tags: [displayList[index].patientType.rawValue, displayList[index].docAppointmentType.rawValue ] , time: "9:30", age: 30, gender: "Female")
                                
                            }
                        }
                    }
                    .frame(width: 300)
                    Spacer()
                }
                HStack(alignment: .center, spacing: 10) {
                        
//                        print(appliedFilter)
//                        print(opdAppList)
//                        if ( appliedFilter != Filter.none ){
//                            appliedFilter = Filter.none
//                            displayList = appList
//                        }else{
//                            appliedFilter = Filter.opd
//                            displayList = opdAppList
//                        }
                        
                        
                    
                    FilterButton(text: "OPD", selected: $filterMode, displayList: $displayList , selectedFilter: $appliedFilter)
                    
                   
                        FilterButton(text: "Operation", selected: $filterMode , displayList: $displayList , selectedFilter: $appliedFilter)
                    
                  
                    FilterButton(text: "Meeting", selected: $filterMode ,displayList: $displayList , selectedFilter: $appliedFilter )
                    

                   
                    
                
                }
            }
            .padding()
            .navigationTitle("Schedule")
        }
    }
}

struct FilterButton: View {
    var text: String
    @State var appList : [DocAppointment] = CustomDocData().appointmentList
    @State var opdAppList : [DocAppointment] = CustomDocData().appointmentList.filter({ $0.docAppointmentType == DocAppointment.DocAppType.opd})
    @State var operationAppList : [DocAppointment] = CustomDocData().appointmentList.filter({ $0.docAppointmentType == DocAppointment.DocAppType.operation})
    @State var meetAppList : [DocAppointment] = CustomDocData().appointmentList.filter({ $0.docAppointmentType == DocAppointment.DocAppType.meeting})
   
    @Binding var selected: String
    @Binding var displayList : [DocAppointment]
    @Binding var selectedFilter : Filter
    
    var body: some View {
        Button(action: {
            print("Hello")
            if (selected == text) {
                selected = "none"
            } else {
                selected = text
            }
            if (selected == text) {
                selectedFilter = Filter.none
                displayList = appList
            } else {
                if(selectedFilter == Filter.opd ){
                    displayList = opdAppList
                }
                if(selectedFilter == Filter.meeting ){
                    displayList = meetAppList
                }
                if(selectedFilter == Filter.operation ){
                    displayList = operationAppList
                }
            }
            CustomDocData().update()
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

enum Filter {
    case none
    case opd
    case operation
    case meeting
}
struct DSchedule_Previews: PreviewProvider {
    static var previews: some View {
        DSchedule()
    }
}
