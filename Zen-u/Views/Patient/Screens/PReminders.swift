//
//  PReminders.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 26/04/23.
//

import SwiftUI

struct PReminders: View {
    @StateObject var appointmentViewModel: DateViewModel = DateViewModel()
    @Namespace var animation
    @State var filterModes: String = "none"
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                LazyVStack(spacing: 30, pinnedViews: [.sectionHeaders]) {
                    Section{
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(appointmentViewModel.existingWeek, id:  \.self){day in
                                    VStack{
                                        VStack(spacing: 10) {
                                            Text(appointmentViewModel.extractDate(date: day, format: "dd"))
                                                .font(.title3)
                                                .fontWeight(.heavy)
                                        }
                                        .frame(width: 60, height: 60)
                                        .foregroundColor(appointmentViewModel.isToday(date: day) ? Color(uiColor: .white) : .secondary)
                                        .background(
                                            ZStack {
                                                if appointmentViewModel.isToday(date: day){
                                                    Circle()
                                                        .fill(Color("Accent"))
                                                        .cornerRadius(20)
                                                } else {
                                                    Circle()
                                                        .fill((Color("Secondary")))
                                                        .cornerRadius(20)
                                                }
                                            }
                                        )
                                        .contentShape(Capsule())
                                        .onTapGesture {
                                            appointmentViewModel.currentDay = day
                                        }
                                        VStack{
                                            Text(appointmentViewModel.extractDate(date: day, format: "EEE"))
                                                .font(.system(size: 14)).fontWeight(.bold)
                                        }
                                        .foregroundStyle(appointmentViewModel.isToday(date: day) ? .primary : .secondary)
                                        .foregroundColor(appointmentViewModel.isToday(date: day) ? Color("Accent") : Color("Heading"))
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                }
                //sort buttons
                HStack(spacing: 20){
                    FilterButtons(text: "Tablets", selected: $filterModes)
                    FilterButtons(text: "Shots", selected: $filterModes)
                    FilterButtons(text: "Tbsp", selected: $filterModes)
                    Spacer()
                }.padding(.vertical, 10) .padding(.horizontal, 20)
                ScrollView{
                    VStack(spacing: 15){
                        ReminderCard(medType: "pills.fill",medName: "Rantadine 500mg", time: "Before breakfast", dose: "04", tags:"Tablet")
                        ReminderCard(medType: "cross.vial",medName: "Septilin Syrup", time: "After Lunch", dose: "01", tags:"Tbsp")
                        ReminderCard(medType: "pills.fill",medName: "Rantadine 500mg", time: "After Lunch", dose: "01", tags:"Tablet")
                        ReminderCard(medType: "syringe",medName: "IV injections", time: "After Dinner", dose: "01", tags:"Shot")
                        ReminderCard(medType: "cross.vial",medName: "Benadryll", time: "After Dinner", dose: "01", tags:"tbsp")
                    }
                } .padding(.horizontal, 20)
                Spacer()
            }
            .navigationTitle("Reminders")
        }
    }
}

struct FilterButtons: View {
    var text: String
    @Binding var selected: String
    
    var body: some View {
        Button {
            if (selected == text) {
                selected = "none"
            } else {
                selected = text
            }
        } label: {
            Text(text)
                .font(.subheadline)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .frame(minWidth: 30, minHeight: 35)
                .background(selected == text ? Color("Accent") : Color("Heading"))
                .cornerRadius(10)
        }
    }
}

struct PReminders_Previews: PreviewProvider {
    static var previews: some View {
        PReminders()
    }
}
