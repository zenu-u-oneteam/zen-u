//
//  PSlotSelection.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI

struct PSlotSelection: View {
    let reason: String
    let department: DepartmentRaw
    let appointmentType: AppointmentTypeRaw
    @StateObject private var viewModel: ViewModel
    
    @Namespace var animation
    
    init(reason: String, department: DepartmentRaw, appointmentType: AppointmentTypeRaw) {
        self.reason = reason
        self.appointmentType = appointmentType
        self.department = department
        self._viewModel = StateObject(wrappedValue: ViewModel(department: department))
    }
    
    var body: some View{
        
        VStack{
            
            Section{
                Text("Select Schedule")
                    .font(.title3.weight(.semibold))
                    .foregroundColor(Color("Heading"))
                    .hLeading()

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(viewModel.upcomingMonth, id:  \.self) {day in
                            Button {
                                viewModel.setSelectedDate(day)
                            } label: {
                                VStack(spacing: 10) {
                                    Text(extractDate(date: day, format: "dd"))
                                        .font(.subheadline.weight(.semibold))
                                    Text(extractDate(date: day, format: "EEE"))
                                        .font(.footnote)
                                }
                                .frame(width: 60, height: 80)
                                .background((viewModel.selectedDate == day) ? Color("Accent") : Color("Secondary"))
                                .foregroundColor((viewModel.selectedDate == day) ? .white : Color("Subheadings"))
                                .cornerRadius(20)
                            }
                        }
                    }
                }
                
                Divider()
                    .padding(.vertical, 30)
                TaskView()
                
                Spacer()
                
                Button {
                    viewModel.checkStatus()
                } label: {
                    TabButton(text: "Continue")
                }
            }
        }
        .ignoresSafeArea(.container, edges: .trailing)
        .padding(20)
        .navigationBarTitle("Booking Consultation", displayMode: .large)
        .navigationDestination(isPresented: $viewModel.canContinue, destination: {
            PBookingSummary(reason: reason, department: department, appointmentType: appointmentType, selectedSlot: viewModel.selectedSlot ?? Date(), allotedDoctor: viewModel.allotedDoctor ?? "")
        })
    }

    func TaskView() -> some View {
        
        VStack(spacing:25) {
            
            Text("Select a slot")
                .font(.title3.weight(.semibold))
                .foregroundColor(Color("Heading"))
                .hLeading()
            
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else {
                    if (viewModel.availableSlots.count > 0) {
                        ScrollView {
                            ForEach(viewModel.availableSlots.chunked(into: 3), id: \.self) { row in
                                HStack(spacing: 15) {
                                    ForEach(row, id: \.self) { slot in
                                        Button {
                                            viewModel.selectSlot(slot)
                                        } label: {
                                            PSpecialButton(buttonText: extractDate(date: slot, format: "HH:mm"), buttonColor: Color("Accent"), active: (viewModel.selectedSlot == slot))
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        Text("No Slots Svailable")
                            .foregroundColor(Color("Heading"))
                    }
                }
            }
            .frame(height: 225)
        }
    }
    
    func headerView() -> some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 10) {
                
                Button(action: {
                    
                }, label: {
                    Image("chevron.left")
                })
                
                VStack(spacing: 40) {
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

struct PSlotSelection_Previews: PreviewProvider {
    static var previews: some View {
        PSlotSelection(reason: "", department: DepartmentRaw(doctors: ["L4KhoPHiaUUDSn2ep51mZtyqx2O2"]), appointmentType: AppointmentTypeRaw(name: "", amount: 0.0, category: "", department: ""))
    }
}
