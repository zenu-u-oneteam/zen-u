//
//  PReminders.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 26/04/23.
//

import SwiftUI

struct PReminders: View {
    @StateObject var appointmentViewModel: ViewModel = ViewModel()
    @Namespace var animation
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        VStack(spacing: 20){
            Text("\(dateFormatter.string(from: Date()))").font(.largeTitle).fontWeight(.black)
            LazyVStack(spacing: 30, pinnedViews: [.sectionHeaders]) {
                Section{
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(appointmentViewModel.currentWeek, id:  \.self){day in
                                VStack{
                                    VStack(spacing: 10) {
                                        Text(appointmentViewModel.extractDate(date: day, format: "dd"))
                                            .font(.system(size: 20))
                                            .fontWeight(.heavy)
                                    }
                                    .frame(width: 60, height: 60)
                                    .background(
                                        ZStack {
                                            if appointmentViewModel.isToday(date: day){
                                                Circle()
                                                    .fill(Color.accentColor)
                                                    .cornerRadius(20)
                                                //  .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
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
                                    .foregroundColor(appointmentViewModel.isToday(date: day) ? .accentColor : .black)
                                }
                            }
                        }
                    }
                    
                }
            }
            Spacer()
            //sort buttons
            HStack(spacing: 20){
                
            }
        }
        .padding(20)
        
    }
    
}

struct PReminders_Previews: PreviewProvider {
    static var previews: some View {
        PReminders()
    }
}
