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
            HStack {
                RoundedRectangle(cornerRadius: 60).frame(width: 150 , height: 50).foregroundColor(Color(doctorTypeBgColor))
                    .overlay( Text("General").foregroundColor(.white))

            }.padding(.bottom , 20)
            Text("Specify Reason (if Any)")
                .fontWeight(.bold)
                .font(.system(size: 20))
                .foregroundColor(Color(blueLabelcColor))
            
            TextField(
              "Mention any symtoms....",
              text: $symtomText
            ).padding()
                .border(.secondary)
            
                
                
        Spacer()
        }.padding(24)
               
    }
}

struct BookingAppointments_Previews: PreviewProvider {
    static var previews: some View {
        PBookingAppointments()
    }
}
