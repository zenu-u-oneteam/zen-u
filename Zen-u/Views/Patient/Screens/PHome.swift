//
//  PatientHomeScreens.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI

struct PHome: View {
    var body: some View {
        VStack() {
          
//                Rectangle().foregroundColor(Color(red: 236/255, green: 236/255, blue: 236/255))
//                    .frame(width: 393,height: 344)
//                    .cornerRadius(50)
                
                VStack(alignment: .leading,spacing: 20) {
                    HStack(spacing:40){
                        Button{
                            
                        }label: {
                            
                            Image(systemName: "person.fill")
                                .resizable()
                                .foregroundColor(Color.black)
                                .frame(width: 18,height: 18)
                                .background(Circle()
                                    .stroke(Color.white,lineWidth: 3)
                                    .background(Circle().fill(Color(red: 243/255, green: 243/255, blue: 243/255)))
                                    .frame(width: 40,height: 40)
                                            
                                )
                        }
                        
                        VStack(alignment: .leading){
                            Text("Good Morning").font(.system(size: 11,weight: .regular))
                            Text("Reze").font(.system(size: 20,weight: .bold))
                        }
                        Spacer()
                        
                        Button(){
                            
                        }label: {
                            
                            Image(systemName: "phone.fill")
                                .resizable()
                                .foregroundColor(Color.blue)
                                .frame(width: 20,height: 20.03)
                                .background(Circle()
                                    .stroke(Color.white,lineWidth: 3)
                                    .background(Circle().fill(Color(red: 243/255, green: 243/255, blue: 243/255)))
                                    .frame(width: 40,height: 40)
                                            
                                )
                                .padding(.leading)
                        }.padding(.trailing,24)
                        
                        
                        
                        
                    }
                    .padding(.init(top: 80, leading: 10, bottom: 0, trailing: 10))
                    
                    Text("How are you feeling today?").font(.system(size: 41,weight: .semibold))
                    
                    HStack(alignment: .center,spacing: 30) {
                        Button {
                            
                        } label: {
                            Text("Consult")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.black)
                                .frame(width: 99,height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                .font(.system(size: 16,weight: .semibold))
                            
                                //.padding()
                    }
                        Button {
                            
                        } label: {
                            Text("Lab")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.black)
                                .frame(width: 68,height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                .font(.system(size: 16,weight: .semibold))

                    }
                        Button {
                            
                        } label: {
                            Text("Vaccination")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.black)
                                .frame(width: 128,height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                .font(.system(size: 16,weight: .semibold))
                            
                                //.padding()
                    }
                        
                }
//                    .buttonStyle(.borderedProminent)
//                        .controlSize(.mini)
                        
                        
                        
                        
                    }
               
                .padding(.leading,24)
                .background(Rectangle().foregroundColor(Color(red: 236/255, green: 236/255, blue: 236/255))
                    .frame(height: 344)
                    .cornerRadius(50))
                .ignoresSafeArea()
                    
                    
            
            VStack(alignment: .leading,spacing: 20){
                Text("Upcoming Appointments")
                    .font(.system(size: 17,weight: .semibold))
                
                   
                    VStack(spacing: -5){
                        HStack{
                            Text("PSV23 (Pneumo)")
                            .font(.system(size: 17,weight: .semibold))
                            .foregroundColor(.white)
                            
                            Spacer()
                            
                            
                            Text("9:30")
                                .font(.system(size: 34,weight:.bold)).foregroundColor(Color.white)
                            
                        }
                        HStack{
                            AppTypeTag(labetText: "Vaccination")
                                .foregroundColor(Color(red: 24/255, green: 119/255, blue: 242/255))
                             Spacer()
                            Text("Dr.Hanna Fiegel")
                            .font(.system(size: 15,weight: .bold))
                            .foregroundColor(Color.white)
                            
                        }
                    }.padding(16)
                    .background(RoundedRectangle(cornerRadius: 17).fill(Color.blue))
                    
                
                VStack(spacing: -5){
                    HStack{
                        Text("Viral Infection")
                        .font(.system(size: 17,weight: .semibold))
                        .foregroundColor(.black)
                        
                        Spacer()
                        
                        
                        Text("10:00")
                            .font(.system(size: 34,weight:.bold)).foregroundColor(Color.black)
                        
                    }
                    HStack{
                        AppTypeTag(labetText: "General")
//                            .foregroundColor(Color(red: 24/255, green: 119/255, blue: 242/255))
                         Spacer()
                        Text("Dr. Ashutosh Malhotra")
                        .font(.system(size: 15,weight: .bold))
                        .foregroundColor(Color.black)
                        
                    }
                }.padding(16)
                    .background(RoundedRectangle(cornerRadius: 17).fill(Color(red: 240/255, green: 240/255, blue: 240/255)))
                
    //Color(red: 24/255, green: 119/255, blue: 242/255)
                
            }.padding(.init(top: 0, leading: 24, bottom: 24, trailing: 24))

//
//                HStack{
//                    VStack(alignment: .leading){
//                        Text("PSV23 (Pneumo)")
//                            .font(.system(size: 17,weight: .semibold))
//                            .foregroundColor(.white)
//
//                        AppTypeTag(labetText: "General")
//
//
//                    }
//                    Spacer()
//                    VStack(alignment: .trailing){
//                        Text("9:30").font(.system(size: 34,weight: .bold)).foregroundColor(Color.white)
//                        Text("Dr.Hannel Fiegele").font(.system(size: 15,weight: .bold)).foregroundColor(Color.white)
//
//                    }
//                }.padding(24)
          
            
                Spacer()
            
                
                
        }
        }
    }

struct PatientHomeScreens_Previews: PreviewProvider {
    static var previews: some View {
        PHome()
    }
}

struct AppTypeTag: View {
    @State var labetText : String
    var body: some View {
        Text(labetText)
            .padding(8)
            .font(.system(size: 13,weight: .semibold))
           //.foregroundColor(Color(red: 24/255, green: 119/255, blue: 242/255))
            .background(RoundedRectangle(cornerRadius: 5).fill(.white).frame(height: 24))
    }
}
