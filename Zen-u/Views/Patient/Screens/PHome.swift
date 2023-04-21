//
//  PatientHomeScreens.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI

struct PHome: View {
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading){
                Rectangle().foregroundColor(Color(red: 236/255, green: 236/255, blue: 236/255))
                    .frame(width: 393,height: 344)
                    .cornerRadius(50)
                
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
                    
//                    HStack(alignment: .center,spacing: 30) {
//                        Button {
//                            
//                        } label: {
//                            Text("Consult")
//                                .fontWeight(.semibold)
//                                .foregroundColor(Color.black)
//                                .frame(width: 99,height: 50)
//                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
//                                .font(.system(size: 16,weight: .semibold))
//                            
//                                //.padding()
//                    }
//                        Button {
//                            
//                        } label: {
//                            Text("Lab")
//                                .fontWeight(.semibold)
//                                .foregroundColor(Color.black)
//                                .frame(width: 68,height: 50)
//                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
//                                .font(.system(size: 16,weight: .semibold))
//
//                    }
//                        Button {
//                            
//                        } label: {
//                            Text("Vaccination")
//                                .fontWeight(.semibold)
//                                .foregroundColor(Color.black)
//                                .frame(width: 128,height: 50)
//                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
//                                .font(.system(size: 16,weight: .semibold))
//                            
//                                //.padding()
//                    }
//                        
//                }
//                    .buttonStyle(.borderedProminent)
//                        .controlSize(.mini)
                        
                        
                        
                        
                    }.padding(.leading,24)
                    
                    
                }
            .ignoresSafeArea()
            
                Spacer()
                
                
            }
        }
    
}

struct PatientHomeScreens_Previews: PreviewProvider {
    static var previews: some View {
        PHome()
    }
}
