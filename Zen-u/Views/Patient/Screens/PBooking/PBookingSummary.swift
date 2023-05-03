//
//  PBookingSummary.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI

struct PBookingSummary: View {
    let reason: String
    let department: DepartmentRaw
    let appointmentType: AppointmentTypeRaw
    let selectedSlot: Date
    let allotedDoctor: String
    @StateObject private var viewModel: ViewModel
    
    init(reason: String, department: DepartmentRaw, appointmentType: AppointmentTypeRaw, selectedSlot: Date, allotedDoctor: String) {
        self.reason = reason
        self.appointmentType = appointmentType
        self.department = department
        self.selectedSlot = selectedSlot
        self.allotedDoctor = allotedDoctor
        self._viewModel = StateObject(wrappedValue: ViewModel(reason: reason, department: department, appointmentType: appointmentType, selectedSlot: selectedSlot, allotedDoctor: allotedDoctor))
    }
    
    var body: some View {
        if viewModel.isLoading {
            ProgressView()
        } else {
            VStack{
                BookingInfoView(slot: selectedSlot, department: department)
                Spacer()
                PaymentView(appointmentType: appointmentType)
            }
            .navigationTitle("Summary")
            .padding(24)
            .navigationDestination(isPresented: $viewModel.hasPaied, destination: {
                PPayment()
            })
        }
    }
    
    func BookingInfoView(slot: Date, department: DepartmentRaw) -> some View {
        VStack(spacing:20) {
            Text("Booking Information")
                .hLeading()
                .font(.title3.weight(.semibold))
                .foregroundColor(Color("Heading"))
            
            HStack {
                Image(systemName: "calendar")
                    .resizable()
                    .foregroundColor(Color.white)
                    .frame(width: 20,height: 20)
                    .frame(width: 60,height: 60)
                    .background(Color("Accent"))
                    .cornerRadius(30)
                    .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Date and Time")
                        .font(.body.weight(.semibold))
                        .padding(.vertical, 3.0)
                    Text(extractDate(date:slot, format:"EEEE, d MMMM, yyyy"))
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("Tag"))
                    Text(extractDate(date:slot, format:"h:mm a"))
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("Tag"))
                }
                Spacer()
            }
            .padding()
            .padding(.vertical, 7)
            .foregroundColor(Color("Heading"))
            .background(Color("Secondary"))
            .cornerRadius(17)
            .padding(.bottom, 40)
            
            Text("Doctor Information")
                .font(.title3.weight(.semibold))
                .foregroundColor(Color("Heading"))
                .hLeading()
            
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .foregroundColor(Color.white)
                    .frame(width: 20,height: 20)
                    .frame(width: 60,height: 60)
                    .background(Color("Accent"))
                    .cornerRadius(30)
                    .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(department.name!) Department")
                        .font(.body.weight(.semibold))
                        .padding(.vertical, 3.0)
                    Text("Hospital Visit")
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("Tag"))
                }
                Spacer()
            }
            .padding()
            .padding(.vertical, 7)
            .foregroundColor(Color("Heading"))
            .background(Color("Secondary"))
            .cornerRadius(17)
        }
    }
    
    func PaymentView(appointmentType: AppointmentTypeRaw) -> some View {
        
        VStack(spacing: 10){
            
            HStack(){
                Text("Total Amount")
                    .fontWeight(.semibold)
                    .hLeading()
                    .font(.system(size: 20))
                Text("INR \(String(format: "%.2f", appointmentType.amount))")
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                    .hTrailing()
                    .font(.system(size: 20))
            }
            .padding(.vertical)
            
            Button {
                Task {
                    await viewModel.makePayment()
                }
            } label: {
                TabButton(text: "Pay Now")
            }
        }
    }
}

struct PBookingSummary_Previews: PreviewProvider {
    static var previews: some View {
        PBookingSummary(reason: "", department: DepartmentRaw(name: "General", doctors: ["L4KhoPHiaUUDSn2ep51mZtyqx2O2"]), appointmentType: AppointmentTypeRaw(name: "", amount: 500.0, category: "", department: ""), selectedSlot: Date(), allotedDoctor: "L4KhoPHiaUUDSn2ep51mZtyqx2O2")
    }
}
