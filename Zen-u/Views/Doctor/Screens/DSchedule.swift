//
//  DSchedule.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI

struct DSchedule: View {
    @State var selectedMonth: Int = 0
    @State var selectedDate: Int = 1
    @State var filterMode: String = "none"
    
    let months = ["January", "February", "March" , "April" , "May" , "June" , "July" , "August" , "September" ,"October" , "November" , "December"]
    let days = [31, 28, 31 , 30 , 31 , 30 , 31, 31 , 30 , 31, 30 , 31]
    
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 25) {
                        ForEach(months.indices, id: \.self) {index in
                            Button {
                                self.selectedMonth = index
                            } label: {
                                Text(months[index])
                                    .foregroundColor(selectedMonth == index ? Color("Accent") : Color("Subheadings"))
                                    .font(.headline.bold())
                            }
                        }
                    }
                    .frame(height: 20)
                    .padding(.bottom, 8)
                }
                
                HStack(spacing: 0) {
                    Spacer()
                    ScrollView(.vertical) {
                        LazyVStack(alignment: .leading, spacing: 10) {
                            ForEach(1...days[selectedMonth] , id: \.self) {
                                index in
                                Button {
                                    self.selectedDate = index
                                } label: {
                                    VStack {
                                        Text(String(index))
                                            .font(.title2.bold())
                                        Text("Thu")
                                            .font(.callout.weight(.light))
                                    }
                                    .foregroundColor(self.selectedDate == index ? Color.white : Color("Subheadings"))
                                    .frame(width: 50 ,height: 70)
                                    .background(self.selectedDate == index ? Color("Accent") : .white)
                                    .cornerRadius(12)
                                }
                            }
                        }
                        .frame(width: 60)
                    }
                    
                    Spacer()
                    
                    ScrollView(.vertical) {
                        LazyVStack (alignment: .leading, spacing: 10){
                            ForEach(0...10, id: \.self) {
                                index in
                                Button {
                                    self.selectedMonth = index
                                } label: {
                                    DScheduleTaskCard(patientName: "Stefania Keller", tags: ["New patient", "OPD"], time: "9:30", age: 30, gender: "Female")
                                }
                            }
                        }
                    }
                    .frame(width: 300)
                    Spacer()
                }
                HStack {
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
