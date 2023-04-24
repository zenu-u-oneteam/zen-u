//
//  ScheduleSettings.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI

struct PScheduleSettings: View {
    @StateObject var appointmentViewModel: ViewModel = ViewModel()
    @Namespace var animation
    var availableSlots: [Int] = [1, 2, 3, 4, 5, 6]
    @State var selectedSlot: Int = 0
    
    func checkActive(_ slot: Int){
        selectedSlot = slot
    }
    
    var body: some View{
        NavigationView {
            ScrollView(.vertical,showsIndicators: false) {
                LazyVStack(spacing: 30, pinnedViews: [.sectionHeaders]){
                    
                    Section{
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            
                            HStack(spacing: 12){
                                
                                ForEach(appointmentViewModel.currentWeek, id:  \.self){day in
                                    
                                    VStack(spacing: 10){
                                        
                                        Text(appointmentViewModel.extractDate(date: day, format: "dd"))
                                            .font(.system(size: 15))
                                            .fontWeight(.semibold)
                                        
                                        Text(appointmentViewModel.extractDate(date: day, format: "EEE"))
                                            .font(.system(size: 14))
                                    }
                                    
                                    .foregroundStyle(appointmentViewModel.isToday(date: day) ? .primary : .secondary)
                                    .foregroundColor(appointmentViewModel.isToday(date: day) ? .white : .black)
                                    .frame(width: 60, height: 80)
                                    .background(
                                        ZStack{
                                            if appointmentViewModel.isToday(date: day){
                                                Rectangle()
                                                    .fill(.blue)
                                                    .cornerRadius(20)
                                                    .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                                
                                            } else {
                                                Rectangle()
                                                    .fill((Color("Secondary")))
                                                    .cornerRadius(20)
                                            }
                                        }
                                    )
                                    .contentShape(Capsule())
                                    .onTapGesture {
                                        appointmentViewModel.currentDay = day
                                    }
                                    
                                }
                              
                                
                            }
                        }
                        Divider()
                        TaskView()
                    } header: {
                        headerView()
                    }
                }
            }
            .ignoresSafeArea(.container, edges: .trailing)
            .padding(20)
            .navigationTitle("Booking Consultation")
            
        }
    }
    
   
    
    func TaskView()->some View{
        
        VStack( spacing:25){
            
           
            
            Text("Select a slot")
                .font(.title2).hLeading()
            
            VStack {
                ForEach(availableSlots.chunked(into: 3), id: \.self) { row in
                        HStack(spacing: 15) {
                            ForEach(row, id: \.self) { slot in
                                
                                Button (action: {checkActive(slot)}){
                                    PSpecialButton(buttonText: "\(slot)", buttonColor: Color.accentColor, active: (selectedSlot == slot))}
                                
                            }
                            
                        }
                    }
                }
            
            Spacer()
            Button(action: {
                
            }, label: {
                TabButton(text: "Continue")
            })
        }
    }
    
    func headerView() ->some View{
        HStack(spacing: 10){
            VStack(alignment: .leading, spacing: 10) {
                VStack(spacing: 40){
                    
                    Text("Select Schedule").font(.title2).hLeading()
                    
                }
            }
            .padding(.top)
            .hLeading()
            
            Button {
                
            }   label: {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                    .padding(.top)
                
            }
        }
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

struct ScheduleSettings_Previews: PreviewProvider {
    static var previews: some View {
        PScheduleSettings()
    }
}


func getSafeArea()->UIEdgeInsets{
    
    guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
        return .zero
    }
    
    guard let safeArea = screen.windows.first?.safeAreaInsets else {
        return .zero
    }
    
    return safeArea
}
