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
                    .font(.system(size: 34, weight: .heavy))
                
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
                //                        .aspectRatio(contentMode: .fit)
                    .frame(width: 15
                           , height: 13)
                    .padding(.all, 20)
            }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 13).fill(Color(.systemGray5)).frame(width: 347, height: 220)
                
                VStack(alignment: .leading , spacing: 10) {
                    
                    HStack(spacing : 20){
                        
                        Image("profileImage")
                            .resizable()
                            .frame(width: 105, height: 105)
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fill)
                            .padding(.trailing, 10)
                        
                        VStack(alignment: .leading){
                            Text("Dr. P Lawrence")
                                .font(.system(size: 20, weight: .bold))
                            
                            Text("Diabetology")
                                .font(.system(size: 12, weight: .semibold))
                                .padding(.bottom, 10)
                            Text("38 years experience")
                                .font(.system(size: 12, weight: .light))
                                .padding(.bottom, 2)
                            
                            Text("MD (General Med)")
                                .font(.system(size: 12, weight: .light))
                        }
                    }
                    
                    VStack{
                        
                        HStack(alignment: .top){
                            HStack (spacing: 5){
                                Image(systemName: "graduationcap")
                                    .font(.system(size: 13))
                                
                                Text("Education:")
                                    .font(.system(size:12 , weight: .bold))
                            }
                            
                            Text("MBBS, MRCP, MRCGP, PGD ( Diabetology & Endocrinology)")
                                .font(.system(size:12 , weight: .light))
                                .lineLimit(nil)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        
                        HStack(alignment: .top){
                            HStack (spacing: 5){
                                Image(systemName: "globe")
                                    .font(.footnote)
                                
                                Text("Languages:")
                                    .font(.callout.bold())
                            }
                            Text("English, Hindi, Malayalam")
                                .font(.system(size:12, weight: .light))
                                .lineLimit(nil)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                            
                        }
                        
                        //                        HStack {
                        //                            Image(systemName: "globe")
                        //                                .font(.system(size: 13))
                        //
                        //                            Text("Languages:")
                        //                                .font(.system(size:12 , weight: .bold))
                        //
                        //                            Text("English, Hindi, Malayalam")
                        //                                .font(.system(size:12, weight: .light))
                        //                                .lineLimit(nil)
                        //                                .multilineTextAlignment(.leading)
                        //                                .fixedSize(horizontal: false, vertical: true)
                        //                        }
                    }
                    
                }.padding(10)
            }
            
            ZStack {
                HStack (spacing : 8){
                    
                    HStack {
                        Image(systemName: "phone.circle.fill")
                            .font(.system(size: 32))
                            .foregroundColor(.blue)
                            .padding(.leading, 5)
                        
                        
                        Text("+91 7858897916")
                            .font(.system(size:12 , weight: .light))
                            .foregroundColor(.black)
                    }
                    Spacer()
                    HStack{
                        Image(systemName: "envelope.circle.fill")
                            .font(.system(size: 32, weight: .light))
                            .foregroundColor(.blue)
                        
                        Text("i.haqcs@gmailcom").foregroundColor(.black)
                            .font(.system(size:12 , weight: .light))
                        
                    }
                }.padding(10)
                    .background(RoundedRectangle(cornerRadius: 13).fill(Color(.systemGray5)).frame(width: 347, height: 60))
            }
            
            VStack(alignment: .leading , spacing: 20) {
                
                Text("Schedules")
                    .font(.system(size: 20, weight: .bold))
                
                HStack {
                    
                    Text("Slot Changes")
                        .font(.system(size:14 , weight: .regular))
                        .foregroundColor(.black)
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Request").font(.system(size:14 , weight: .regular)).foregroundColor(.white).background( RoundedRectangle(cornerRadius: 25).fill(.black).frame(width : 93 , height: 30))
                        
                    }.padding(.trailing , 16)
                    
                }.padding(.bottom, 10)
                
                HStack {
                    
                    Text("Apply for Leaves")
                        .font(.system(size:14 , weight: .regular))
                        .foregroundColor(.black)
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Request").font(.system(size:14 , weight: .regular)).foregroundColor(.white).background( RoundedRectangle(cornerRadius: 25).fill(.black).frame(width : 93 , height: 30))
                        
                    }.padding(.trailing , 16)
                    
                }
            }
            
            .background(RoundedRectangle(cornerRadius: 13).fill(Color(.systemGray5)).frame(width: 347, height: 147))
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
