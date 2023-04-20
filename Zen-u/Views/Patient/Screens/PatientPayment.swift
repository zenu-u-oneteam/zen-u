//
//  PatientPayment.swift
//  Zen-u
//
//  Created by Debarghya Barik on 19/04/23.
//

import SwiftUI

struct PatientPayment: View {
    var body: some View {
        ZStack(){
            VStack(alignment: .leading){
                Text("Confirmation")
                    .font(.system(size: 32).weight(.bold))
                    .font(.title).foregroundColor(.black)
                    .padding(.bottom, 22)
                
                Image("Group 99").aspectRatio(contentMode: .fit).frame(width: 346, height: 380).padding(.bottom, 61)
                
                Button {
                    print(" Return to Home button")
                }label: {
                    Text(" Return to Home ")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .frame(width: 318, height: 20)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
                .padding(.bottom, 14)
                
                Button {
                    print("View Upcoming Appointments button")
                }label: {
                    Text(" View Upcoming Appointments ")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
                .frame(width: 318, height: 20)
                .padding()
                .background(Color(red: 239/255, green: 239/255, blue: 239/255))
                .cornerRadius(10)
            }
            
            VStack(){
                Button{
                    print("Appointment confirmed button")
                } label: {
                    Text(" Appointment Confirmed! ")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .frame(width: 312, height: 20)
                .padding()
                .background(Color(red: 239/255, green: 239/255, blue: 239/255))
                .cornerRadius(25)
                .foregroundColor(.white)
                .padding(.top, 190)
            }
        }
    }
}

struct PatientPayment_Previews: PreviewProvider {
    static var previews: some View {
        PatientPayment()
    }
}
