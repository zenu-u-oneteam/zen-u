//
//  DAppointmentViewAll.swift
//  Zen-u
//
//  Created by Aindrila Ray on 04/05/23.
//

import SwiftUI

struct DAppointmentViewAll: View {
    var heading: String
    @State var typeIndex1: Int = 0
    var typeSelections1: [String] = ["Lab Reports", "Vaccination Reports", "Past Appointments"]
    var patientRecords : [HealthRecord]
    var appointmentRecords : [AppointmentReports]
    func formattedDateComponents(dateComponents: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy 'at' h:mm a"
        return dateFormatter.string(from: dateComponents)
    }
    
    
    
    var body: some View {
        NavigationStack{
                if(patientRecords.count != 0 && (typeIndex1 == 0 || typeIndex1 == 1)) {
                    
                    ScrollView(showsIndicators: false){
                        
                        ForEach(patientRecords.filter { $0.type?.category == heading } , id: \.self) {
                            healthRecord in
                            
                            VStack(alignment: .leading, spacing: 12) {
                                Button{
                                }label: {
                                    NavigationLink(destination: CustomPDFView(title: healthRecord.name, url: healthRecord.document, show: false)) {
                                        HStack (alignment: .center, spacing: 12){
                                            Image(systemName: healthRecord.type?.image ?? "doc.text.magnifyingglass")
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                                .foregroundColor(Color("Heading"))
                                                .padding(.leading,20)
                                            
                                            
                                            VStack(alignment: .leading, spacing: 3) {
                                                Text(healthRecord.name)
                                                    .font(.system(size: 16).weight(.semibold))
                                                    .padding(.leading, 10)
                                                    .hLeading()
                                                    .foregroundColor(Color("Heading"))
                                                    .frame(width: 200)
                                                
                                                Text(formattedDateComponents(dateComponents: healthRecord.appointmentTime))
                                                    .font(.system(size: 14).weight(.regular))
                                                    .foregroundColor(.gray)
                                                    .padding(.leading, 10)
                                                    .hLeading()
                                                    .frame(width: 200)
                                                
                                            }.padding(.horizontal, 10)
                                                .padding(.vertical, 10)
                                            Image(systemName: "chevron.forward")
                                                .foregroundColor(Color(UIColor.tertiaryLabel))
                                                .padding(.trailing, 10)
                                                .hTrailing()
                                            
                                            
                                            Spacer()
                                        }
                                        
                                        
                                    }
                                }
                            }.padding(.all, 5)
                            Divider()
                            .frame(width: 314)
                        }   .frame(width: 350)
                            .padding(.vertical, 10)
                            .background(Color("Secondary"))
                            .padding(.top, 20)
                            .padding(.leading, 3)
                            .cornerRadius(15)
                    }.padding()
                    
                    
                }
                else if (appointmentRecords.count != 0 && typeIndex1 == 2){
                    ScrollView(showsIndicators: false){
                        
                        ForEach(appointmentRecords, id: \.self)
                        {
                            healthRecord in
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Button{
                                    
                                } label: {
                                    NavigationLink(destination: PAppointmentRecordView(appointmentRecord: healthRecord)) {
                                        HStack (alignment: .center, spacing: 12){
                                            Image(systemName: healthRecord.type?.image ?? "doc.text.magnifyingglass")
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                                .padding(.leading)
                                                .foregroundColor(Color("Heading"))
                                            
                                            VStack(alignment: .leading, spacing: 10) {
                                                Text(healthRecord.doctor?.name ?? "Dr. Doctor")
                                                    .font(.system(size: 16).weight(.semibold))
                                                    .padding(.leading, 10)
                                                    .hLeading()
                                                    .foregroundColor(Color("Heading"))
                                                    .frame(width: 200)
                                                
                                                Text(formattedDateComponents(dateComponents: healthRecord.appointmentTime))
                                                    .font(.system(size: 14).weight(.regular))
                                                    .foregroundColor(.gray)
                                                    .padding(.leading, 10)
                                                    .hLeading()
                                                    .frame(width: 200)
                                            }
                                            Image(systemName: "chevron.forward")
                                                .foregroundColor(Color(UIColor.tertiaryLabel))
                                                .padding(.trailing, 10)
                                                .hTrailing()
                                            
                                            
                                            Spacer()
                                        }
                                        
                                    }
                                }
                            }.padding(.all, 5)
                            Divider()
                                .frame(width: 314)
                        }
                        .frame(width: 350)
                            .padding(.vertical, 10)
                            .background(Color("Secondary"))
                            .padding(.top, 20)
                            .padding(.leading, 3)
                            .cornerRadius(15)
                    }.padding()
                }
                else{
                    emptyDisplayMessage(message: "No health Records to display")
                }
                
            }
            .navigationTitle(heading)
        }
        
        
        
    
}

struct DAppointmentViewAll_Previews: PreviewProvider {
    static var previews: some View {
        DAppointmentViewAll(heading: "Past Appointments", typeIndex1: 1, patientRecords: [], appointmentRecords: [AppointmentReports(id: "", appointmentTime: Date.now, symptoms: "ya ya ya", medicalAdvice: "ya ya ya")])
    }
}
