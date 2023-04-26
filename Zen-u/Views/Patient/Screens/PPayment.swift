//
//  PatientPayment.swift
//  Zen-u
//
//  Created by Debarghya Barik on 19/04/23.
//

import SwiftUI

struct PPayment: View {
    var body: some View {
        NavigationView {
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
                                
                VStack(spacing: 14){
                    Button {
                        print(" Return to Home button")
                    }label: {
                        NavigationLink(destination: PMain()) {
                            TabButton(text: "Return to Home")
                        }
                    }
                    Button {
                        print("View Upcoming Appointments button")
                    }label: {
                        NavigationLink(destination: PAppointment()) {
                            TabButton(text: "View Upcoming Appointments", selected: false)
                        }
                    }
                }
                
                Spacer()
            }
            .navigationTitle("Confirmation")
        }
    }
}

struct PPayment_Previews: PreviewProvider {
    static var previews: some View {
        PPayment()
    }
}
