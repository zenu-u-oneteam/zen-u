//
//  PDepartmentDetails.swift
//  Zen-u
//
//  Created by Tanvi Gupta on 21/04/23.
//

import SwiftUI
var deptBackColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1)
var imgBackColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)

struct PDepartmentDetails: View {
    @State var isDepartmentSelected : Bool = true
    var body: some View {
        ZStack {
            VStack(alignment: .leading){
                Text("Booking\nConsultation").font(.system(size: 35 , weight : .bold)).padding(.bottom,40)

                Text("Choose Type of Doctor")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                
                    .padding(.bottom , 20)
                HStack (spacing: 16){
                    RoundedRectangle(cornerRadius: 60)
                        
                        .foregroundColor(isDepartmentSelected == false ? Color(doctorTypeBgColor) : Color(color))
                        .frame(width: 150 , height: 50)
                        
                        .overlay( Text("General").font(.custom("Averta-Semibold", size: 14)).foregroundColor(isDepartmentSelected == false ? .white : .black))

                    RoundedRectangle(cornerRadius: 60)
                        
                        .foregroundColor(isDepartmentSelected == true ? Color(doctorTypeBgColor) : Color(color))
                        .frame(width: 150 , height: 50)
                        
                        .overlay( Text("Specialist")
                            .font(.custom("Averta-Semibold", size: 14))
                            .foregroundColor(isDepartmentSelected == true ? .white : .black))

                }.padding(.bottom , 60)
                    
                Text("About Department")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding(.bottom,30)
                
                HStack {
                    Circle().fill(Color(imgBackColor)).frame(width: 75 , height: 75)
                    VStack(alignment : .leading , spacing: 8){
                        Text("Oncology Department").fontWeight(.bold)
                        Text("The oncology department in a hospital is dedicated to the diagnosis, treatment, and management of cancer patients.")
                    }.padding(.init(top: 0, leading: 8, bottom: 0, trailing: 8))
                }
                .padding(.init(top: 24, leading: 16, bottom: 24, trailing: 16))
                .background(RoundedRectangle(cornerRadius: 15).fill(Color(deptBackColor)))
                Spacer()
                Button {
                    
                } label: {
                    Text("Continue" )
                        .font(.custom("Averta-Semibold", size: 16))
                }.padding()
                    .padding(.horizontal,122)
                    .background(Color(buttonColor)
                        .cornerRadius(10))
                    .foregroundColor(.white)

                
                    
           
            
            }.padding(24)
            
        }
    }
    }


struct PDepartmentDetails_Previews: PreviewProvider {
    static var previews: some View {
        PDepartmentDetails()
    }
}
