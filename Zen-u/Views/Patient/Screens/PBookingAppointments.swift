//
//  BookingAppointments.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI
import UIKit

var color = #colorLiteral(red: 0.9625412822, green: 0.9625412822, blue: 0.9625412822, alpha: 1)
var hintTextColor = #colorLiteral(red: 0.7137254902, green: 0.7019607843, blue: 0.7019607843, alpha: 1)
var doctorTypeBgColor = #colorLiteral(red: 0.09411764706, green: 0.4666666667, blue: 0.9490196078, alpha: 1)
var buttonColor = #colorLiteral(red: 0.1882352941, green: 0.5333333333, blue: 1, alpha: 1)

struct PBookingAppointments: View {
    @State var symtomText: String = ""
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Text("Booking\nConsultation").font(.system(size: 35 , weight : .bold)).padding(.bottom,40)
    //            HStack(alignment: .lastTextBaseline, spacing: 24){
    //                Button {
    //
    //                } label: {
    //                    Image(systemName: "arrow.left")
    //                        .frame(width: 22.0, height: 22.0)
    //                }
    //                Spacer()
    //
    //                Button {
    //
    //                } label: {
    //                    Image(systemName: "phone").foregroundColor(Color.black).frame(width: 20.0, height: 20.0)
    //                }.background {
    //                    Circle().fill(Color(color))
    //                        .frame(width: 40, height: 40
    //                        )
    //                }
    //
    //
    //                Button {
    //
    //                } label: {
    //                    Image(systemName: "person.fill").foregroundColor(Color.black).frame(width: 20.0, height: 20.0)
    //                }.background {
    //                    Circle().fill(Color(color))
    //                        .frame(width: 40, height: 40
    //                        )
    //                }
    ////                .frame(maxWidth: .infinity, alignment: .trailing)
    //            }.padding(.bottom , 20)
//                Text("Booking Appointments")
//                    .fontWeight(.bold)
//                    .font(.custom("Gilroy-Bold", size: 24))
//                    .padding(.bottom , 40)
                Text("Choose Type of Doctor")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                
                    .padding(.bottom , 20)
                HStack (spacing: 12){
                    RoundedRectangle(cornerRadius: 60)
                        
                        .foregroundColor(Color(doctorTypeBgColor))
                        .frame(width: 150 , height: 50)
                        
                        .overlay( Text("General").font(.custom("Averta-Semibold", size: 14)).foregroundColor(.white)).background {
                            RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.secondary, lineWidth: 4)
                        }
                    RoundedRectangle(cornerRadius: 60)
                        
                        .foregroundColor(Color(color))
                        .frame(width: 150 , height: 50)
                        
                        .overlay( Text("Specialist")
                            .font(.custom("Averta-Semibold", size: 14))
                            .foregroundColor(Color(doctorTypeBgColor)))
                        .background {
                            RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color(doctorTypeBgColor), lineWidth: 4)
                        }

                }.padding(.bottom , 60)
                Text("Specify Reason (if Any)")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding(.bottom,30)
                
                ZStack (alignment: .leading){
                    
                    TextEditor(
                     
                      text: $symtomText
                     
                    ).padding()
                    .frame(height: 200.0 )
                    .colorMultiply(Color(color))
                    .background(Color(color))
                    .overlay(
                            RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.secondary, lineWidth: 1)
                )
                    if symtomText.isEmpty {
                        VStack  {
                            Text("Mention any symtoms...").padding(.top,30)
                                .font(.system(size: 16)).padding(10)
                                .foregroundColor(Color(hintTextColor))
                            Spacer()
                        }
                        
                    }
                }.padding(.bottom , 40)
                   
                Button {
                    
                } label: {
                    Text("Continue" )
                        .font(.custom("Averta-Semibold", size: 16))
                }.padding()
                    .padding(.horizontal,122)
                    .background(Color(buttonColor)
                        .cornerRadius(10))
                    .foregroundColor(.white)

                
                    
                    
            Spacer()
            }.padding(24)
//                .navigationTitle(Text("Booking Consultation"))
        }
        
    }
}

struct BookingAppointments_Previews: PreviewProvider {
    static var previews: some View {
        PBookingAppointments()
    }
}
