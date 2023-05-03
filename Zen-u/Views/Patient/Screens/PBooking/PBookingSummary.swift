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
    @StateObject private var viewModel: ViewModel = ViewModel()

    var body: some View {
        VStack{
            BookingInfoView()
            Spacer()
            PaymentView()
        }
        .navigationTitle("Summary")
        .padding(24)
    }
}

func BookingInfoView() -> some View {
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
                Text("Thursday,1st July,2023")
                    .font(.footnote.weight(.semibold))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("Tag"))
                Text("7:30 PM")
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
                Text("Oncology Department")
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

func PaymentView() -> some View {
    
    VStack(spacing: 10){
        
        HStack(){
            Text("Total Amount")
                .fontWeight(.semibold)
                .hLeading()
                .font(.system(size: 20))
            Text("INR 1299")
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
                .hTrailing()
                .font(.system(size: 20))
        }
        .padding(.vertical)
        
        Button {
            print("Pay Now")
        } label: {
            NavigationLink(destination: PPayment()) {
                TabButton(text: "Pay Now")
            }
        }
    }
}

struct PBookingSummary_Previews: PreviewProvider {
    static var previews: some View {
        PBookingSummary(reason: "", department: DepartmentRaw(doctors: ["L4KhoPHiaUUDSn2ep51mZtyqx2O2"]), appointmentType: AppointmentTypeRaw(name: "", amount: 0.0, category: "", department: ""), selectedSlot: Date())
    }
}
