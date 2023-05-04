//
//  PPayment.swift
//  Zen-u
//
//  Created by Prakhar Singh on 04/05/23.
//

import SwiftUI

struct PPayment: View {
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Image("AppointmentConfirmed")
                    .frame(width: 270, height: 270)
                    .padding()
                Text("Appointment Confirmed!")
                    .font(.title3.bold())
            }
            .frame(width: 350, height: 380)
            .background(Color("Secondary"))
            .cornerRadius(30)
            .padding(.vertical, 30)
            
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
            .padding(.bottom, 24)
        }
        .navigationTitle("Confirmation")
        .navigationBarBackButtonHidden()
    }
}

struct PPayment_Previews: PreviewProvider {
    static var previews: some View {
        PPayment()
    }
}
