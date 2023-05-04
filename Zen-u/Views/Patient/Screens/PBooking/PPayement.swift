//
//  PatientPayment.swift
//  Zen-u
//
//  Created by Debarghya Barik on 19/04/23.
//

import SwiftUI

struct PPayment: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack{
                Spacer()
                VStack {
                    Image("AppointmentConfirmed")
                        .frame(width: 270, height: 270)
                        .padding()
                    Text("Appointment Confirmed!")
                        .font(.title3.bold())
                }
                Spacer()
            } .frame(height: 380)
                .background(Color("Secondary"))
                .cornerRadius(30)
            Spacer()
            
            VStack(spacing: 14){
                Button {
                    print(" Return to Home button")
                }label: {
                    NavigationLink(destination: PHome()) {
                        TabButton(text: "Return to Home")
                    }
                }
                Button {
                    print("View Upcoming Appointments button")
                } label: {
                    NavigationLink(destination: PAppointment().tag(1)) {
                        TabButton(text: "View Upcoming Appointments", selected: false)
                    }
                }
            }
        }
        .navigationTitle("Confirmation")
        .padding(16)
        
    }
}

struct PPayment_Previews: PreviewProvider {
    static var previews: some View {
        PPayment()
    }
}
