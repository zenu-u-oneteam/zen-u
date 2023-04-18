//
//  BookingAppointments.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI
import UIKit

var color = #colorLiteral(red: 0.9625412822, green: 0.9625412822, blue: 0.9625412822, alpha: 1)
var blueLabelcColor = #colorLiteral(red: 0.2392156863, green: 0.4431372549, blue: 0.7529411765, alpha: 1)
var doctorTypeBgColor = #colorLiteral(red: 0.1882352941, green: 0.5333333333, blue: 1, alpha: 1)
var buttonColor = #colorLiteral(red: 0.1882352941, green: 0.5333333333, blue: 1, alpha: 1)

struct PBookingAppointments: View {
    @State private var symtomText: String = ""
    var body: some View {
        VStack(alignment: .leading){
            
            HStack(alignment: .lastTextBaseline, spacing: 24){
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .frame(width: 22.0, height: 22.0)
                }
                Spacer()

                Button {
                    
                } label: {
                    Image(systemName: "phone").foregroundColor(Color.black).frame(width: 20.0, height: 20.0)
                }.background {
                    Circle().fill(Color(color))
                        .frame(width: 40, height: 40
                        )
                }
                

                Button {
                    
                } label: {
                    Image(systemName: "person.fill").foregroundColor(Color.black).frame(width: 20.0, height: 20.0)
                }.background {
                    Circle().fill(Color(color))
                        .frame(width: 40, height: 40
                        )
                }
//                .frame(maxWidth: .infinity, alignment: .trailing)
            }.padding(.bottom , 20)
            Text("Booking Appointments")
                .fontWeight(.bold)
                .font(.system(size: 24))
                .padding(.bottom , 40)
            Text("Choose Type of Doctor")
                .fontWeight(.bold)
                .font(.system(size: 20))
                .foregroundColor(Color(blueLabelcColor))
                .padding(.bottom , 10)
            HStack (spacing: 12){
                RoundedRectangle(cornerRadius: 60)
                    
                    .foregroundColor(Color(doctorTypeBgColor))
                    .frame(width: 150 , height: 50)
                    
                    .overlay( Text("General").foregroundColor(.white)).background {
                        RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.secondary, lineWidth: 4)
                    }
                RoundedRectangle(cornerRadius: 60)
                    
                    .foregroundColor(Color(color))
                    .frame(width: 150 , height: 50)
                    
                    .overlay( Text("Specialist").foregroundColor(Color(doctorTypeBgColor)))
                    .background {
                        RoundedRectangle(cornerRadius: 30)
                                .stroke(Color(doctorTypeBgColor), lineWidth: 4)
                    }

            }.padding(.bottom , 40)
            Text("Specify Reason (if Any)")
                .fontWeight(.bold)
                .font(.system(size: 20))
                .foregroundColor(Color(blueLabelcColor))
                .padding(.bottom,30)
            
            TextField(
              "Mention any symtoms....",
              text: $symtomText
             
            )
            .multilineTextAlignment(.leading)
            .frame(height: 200.0 , alignment: .topLeading)
            .padding()
            .background(Color(color))
            .overlay(
                    RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.secondary, lineWidth: 1)
                ).padding(.bottom , 40)
               
            Button {
                
            } label: {
                Text("Continue" )
            }.padding()
                .padding(.horizontal,122)
                .background(Color(buttonColor)
                    .cornerRadius(10))
                .foregroundColor(.white)

            
                
                
        Spacer()
        }.padding(24)
               
    }
}

struct BookingAppointments_Previews: PreviewProvider {
    static var previews: some View {
        PBookingAppointments()
    }
}
