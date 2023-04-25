//
//  DoctorProfile.swift
//  Zen-u
//
//  Created by Inzamam on 24/04/23.
//

import SwiftUI

struct DoctorProfile: View {
    @State private var selectedOption = "Option 1"
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Profile")
                    .font(.largeTitle.weight(.heavy))
                
                Spacer()
                
                
                Menu {
                    Button("Edit") {
                        self.selectedOption = "Option 1"
                    }
                    Button("Settings") {
                        self.selectedOption = "Option 2"
                    }
                    Button("Log Out") {
                        self.selectedOption = "Option 3"
                    }
                }
            label: {
                Image(systemName: "line.horizontal.3")
                    .resizable()
                    .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                    .frame(width: 15
                           , height: 13)
                    .padding(.all, 20)
            }
            }
            
            VStack(alignment: .leading , spacing: 10) {
                
                HStack(spacing : 20) {
                    
                    Image("profileImage")
                        .resizable()
                        .frame(width: 105, height: 105)
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fill)
                        .padding(.horizontal, 15)
                    
                    VStack(alignment: .leading){
                        Text("Dr. P Lawrence")
                            .font(.title3.bold())
                        Text("Diabetology")
                            .font(.caption.weight(.semibold))
                            .padding(.bottom, 10)
                        Text("38 years experience")
                            .font(.caption.weight(.light))
                            .padding(.bottom, 2)
                        Text("MD (General Med)")
                            .font(.caption.weight(.light))
                    }
                    Spacer()
                }
                
                VStack(alignment: .leading){
                    
                    HStack(alignment: .top){
                        HStack (spacing: 5){
                            Image(systemName: "graduationcap")
                                .font(.footnote)
                                .frame(width: 20)
                            
                            Text("Education:")
                                .font(.caption.weight(.semibold))
                            
                        }
                        .frame(width: 95)
                        
                        Text("MBBS, MRCP, MRCGP, PGD (Diabetology & Endocrinology)")
                            .font(.caption.weight(.light))
                            .lineLimit(nil)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(.bottom, 2)
                    .padding(.horizontal, 15)

                    
                    HStack(alignment: .top){
                        HStack (spacing: 5){
                            Image(systemName: "globe")
                                .font(.footnote)
                                .frame(width: 20)

                            Text("Languages:")
                                .font(.caption.weight(.semibold))
                        }
                        .frame(width: 95)
                        
                        Text("English, Hindi, Malayalam")
                            .font(.caption.weight(.light))
                            .lineLimit(nil)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                        
                    }
                    .padding(.horizontal, 15)
                }
                .padding(.trailing, 20)
            }
            .padding(10)
            .frame(width: 347, height: 220)
            .background(Color("Secondary"))
            .cornerRadius(13)
            
            
            
            HStack (spacing : 8){
                
                HStack {
                    Image(systemName: "phone.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.accentColor)
                        .padding(.leading, 5)
                    
                    
                    Text("+91 7858897916")
                        .font(.caption.weight(.light))
                        .foregroundColor(Color("Heading"))
                }

                HStack{
                    Image(systemName: "envelope.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.accentColor)
                    
                    Text("i.haqcs@gmail.com")
                        .foregroundColor(Color("Heading"))
                        .font(.caption.weight(.light))
                    
                }
            }
            .padding(10)
            .background(Color("Secondary"))
            .cornerRadius(13)
            .frame(width: .infinity, height: 60)
            
            VStack(alignment: .leading , spacing: 20) {
                
                Text("Schedules")
                    .font(.title3.bold())
                
                HStack {
                    
                    Text("Slot Changes")
                        .font(.footnote)
                        .foregroundColor(Color("Heading"))
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Request")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    .background(RoundedRectangle(cornerRadius: 25)
                        .fill(Color("Heading"))
                        .frame(minWidth : 93 , minHeight: 30))
                    .padding(.trailing , 16)
                    
                }.padding(.bottom, 10)
                
                HStack {
                    
                    Text("Apply for Leaves")
                        .font(.footnote)
                        .foregroundColor(Color("Heading"))
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Request")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    .background(RoundedRectangle(cornerRadius: 25)
                        .fill(Color("Heading"))
                        .frame(minWidth : 93 , minHeight: 30))
                    .padding(.trailing , 16)
                    
                }.padding(.bottom, 10)
                
            }
            
            .background(RoundedRectangle(cornerRadius: 13).fill(Color("Secondary"))
                .frame(width: 347, height: 147))
            .padding(20)
            Spacer()
        }.padding(24)
    }
}

struct DoctorProfile_Previews: PreviewProvider {
    static var previews: some View {
        DoctorProfile()
    }
}
