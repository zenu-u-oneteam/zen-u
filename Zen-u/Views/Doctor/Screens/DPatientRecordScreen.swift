//
//  DPatientRecordScreen.swift
//  Zen-u
//
//  Created by Aakriti Rawat on 27/04/23.
//

import SwiftUI
import Foundation

struct DPatientRecordScreen: View {
    
    @StateObject private var viewModel = ViewModel()

    
    @State private var symptoms = ""
    @State private var medicalAdvice = ""
    @State private var prescription = ""
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                HStack{
                    HStack{
                        Image(systemName: "calendar")
                        Text("12/12/23").font(.body)
                            .padding(.vertical, 8)
                    }
                    .background(RoundedRectangle(cornerRadius: 8)
                        .fill(Color("Secondary"))
                        .frame(width: 134, height: 33))
                    .padding(.trailing, 30)
            
                    HStack{
                        Image(systemName: "clock")
                        Text("9:41 AM")
                            .font(.body)
                            .padding(.vertical, 8)
                    }.background(RoundedRectangle(cornerRadius: 8)
                        .fill(Color("Secondary"))
                        .frame(width: 113, height: 33))
                    
                }.padding(.horizontal, 20)
                
                VStack{
                    VStack(alignment: .leading){
                        Text("Symptoms").bold()
                            .foregroundColor(Color("Subheadings"))
                        TextEditor(text: $symptoms).padding()
                            .scrollContentBackground(.hidden)
                            .frame(width: 337, height: 104)
                            .background(Color("Secondary"))
                            .cornerRadius(15)
                    }
                    
                    VStack(alignment: .leading){
                        Text("Medical Advice").bold()
                            .foregroundColor(Color("Subheadings"))
                        TextEditor(text: $medicalAdvice).padding()
                            .scrollContentBackground(.hidden)
                            .frame(width: 337, height: 104)
                            .background(Color("Secondary"))
                            .cornerRadius(15)
                    }.padding(.vertical, 20)
                    
                    VStack(alignment: .leading){
                        Text("Prescription").bold()
                            .foregroundColor(Color("Subheadings"))
                        TextEditor(text: $prescription).padding()
                            .scrollContentBackground(.hidden)
                            .frame(width: 337, height: 104)
                            .background(Color("Secondary"))
                            .cornerRadius(15)
                    }
                }.padding(.top, 35)
                    
                Spacer()
                
                Button{
                    viewModel.addAppointmentReport(symptoms: symptoms, medicalAdvice: medicalAdvice, prescription: prescription)
                } label: {
                    Text("Done").foregroundColor(Color("Primary"))
                        .frame(width:335, height:47)
                        .background(Color("AccentColor"))
                        .cornerRadius(14)
                }
                
            }.padding(.horizontal, 30)
                .padding(.top, 20)
                .navigationTitle("Appointment Record")
        }
    }
}

struct DPatientRecordScreen_Previews: PreviewProvider {
    static var previews: some View {
        DPatientRecordScreen()
    }
}
