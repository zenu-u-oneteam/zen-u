//
//  BookingAppointments.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI


struct PBookingAppointments: View {
    @State var symtomText: String = ""
    @State var showModel: Bool = false
    var body: some View {
        ZStack {
            VStack(alignment: .leading){
                
                Text("Choose Type of Doctor")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding(.bottom , 20)
                
                HStack (spacing: 16){
                    RoundedRectangle(cornerRadius: 60)
                    
                        .foregroundColor(showModel == false ? Color("Accent") : Color("Secondary"))
                        .frame(width: 150 , height: 50)
                        .overlay(Text("General")
                            .font(.callout)
                            .foregroundColor(showModel == false ? .white : Color("Heading")))
                    
                    RoundedRectangle(cornerRadius: 60)
                    
                        .foregroundColor(showModel == true ? Color("Accent") : Color("Secondary"))
                        .frame(width: 150 , height: 50)
                        .overlay(Text("Specialist")
                            .font(.callout)
                            .foregroundColor(showModel == true ? .white : Color("Heading")))
                    
                }
                .padding(.bottom , 60)
                .onTapGesture {
                    showModel = true
                    print("Tapped")
                }
                Text("Specify Reason (if Any)")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding(.bottom,30)
                
                ZStack (alignment: .leading) {
                    
                    TextEditor(text: $symtomText)
                        .font(.body.weight(.light))
                        .onTapGesture {
                            if symtomText == "Mention any symptoms..." {
                                symtomText = ""
                            }
                        }
                    
                    if symtomText.isEmpty {
                        Text("Mention any symptoms...")
                            .foregroundColor(Color("Heading"))
                            .font(.body.weight(.light))
                            .padding(.horizontal, 4)
                            .padding(.top, -76)
                    }
                }
                .padding()
                .frame(height: 200.0)
                .colorMultiply(Color("Secondary"))
                .background(Color("Secondary"))
                .cornerRadius(26)
                .overlay(
                    RoundedRectangle(cornerRadius: 26)
                        .stroke(Color("Secondary"), lineWidth: 1)
                )
                
                Spacer()
                
                Button {
                    
                } label: {
                    NavigationLink(destination: PScheduleSettings()) {
                        TabButton(text: "Continue")
                    }
                }
                Spacer()
            }
            .padding(24)
            SpecialistModelView(isShowing: $showModel)
        }
        .navigationTitle("Booking Consultation")
    }
}

struct PBookingAppointments_Previews: PreviewProvider {
    static var previews: some View {
        PBookingAppointments()
    }
}
