//
//  PAppointmentRecordView.swift
//  Zen-u
//
//  Created by Aindrila Ray on 03/05/23.
//

import SwiftUI

struct PAppointmentRecordView: View {
    var appointmentRecord: AppointmentReports
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    VStack(alignment: .leading){
                        Text("Symptoms")
                            .font(.title3.bold())
                            .hLeading()
                            .padding(20)
                            .padding(.top, 40)
                            .foregroundColor(Color("Heading"))
                        Text(appointmentRecord.symptoms)
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            .hLeading()
                            .padding(20)
                            .foregroundColor(Color("Subheadings"))
                            .background(Color("Secondary"))
                            .cornerRadius(15)
                            .padding(.horizontal, 15)
                        
                    }
                    
                    VStack(alignment: .leading){
                        Text("Medical Advice")
                            .font(.title3.bold())
                            .hLeading()
                            .padding(20)
                            .padding(.top, 40)
                            .foregroundColor(Color("Heading"))
                        Text(appointmentRecord.medicalAdvice)
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            .hLeading()
                            .padding(20)
                            .foregroundColor(Color("Subheadings"))
                            .background(Color("Secondary"))
                            .cornerRadius(15)
                            .padding(.horizontal, 15)
                    }
                    if(appointmentRecord.prescriptions != nil){
                        VStack(alignment: .leading){
                            Text("Prescriptions")
                                .font(.title3.bold())
                                .hLeading()
                                .padding(20)
                                .padding(.top, 40)
                                .foregroundColor(Color("Heading"))
                            Text(appointmentRecord.prescriptions ?? "none")
                                .font(.system(size: 16))
                                .fontWeight(.regular)
                                .hLeading()
                                .padding(20)
                                .foregroundColor(Color("Subheadings"))
                                .background(Color("Secondary"))
                                .cornerRadius(15)
                                .padding(.horizontal, 15)
                        }
                    }
                }
            }
            
            
        }
        .navigationTitle("Report")
    }
}

struct PAppointmentRecordView_Previews: PreviewProvider {
    static var previews: some View {
        PAppointmentRecordView(appointmentRecord: AppointmentReports(id: "1", appointmentTime: Date.now, symptoms: "", medicalAdvice: "", prescriptions: "yada yada yada"))
    }
}
