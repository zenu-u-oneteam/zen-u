//
//  PHealthRecords.swift
//  Zen-u
//
//  Created by Aindrila Ray on 26/04/23.
//

import SwiftUI

struct PHealthRecords: View {
    var tableHeadings: [HealthRecordType]
    @State private var ButtonClicked = "Prescriptions"
    @State private var isActive: Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                VStack(alignment: .leading){
                    Text("All Health Documents").font(.system(size: 20)).bold()
                        .hLeading()
                        .padding(.all, 20)
                        .padding(.top, 40)
                        .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                    ZStack{
                        Rectangle()
                            .frame(width: 346, height: 340)
                            .foregroundColor(Color("Secondary"))
                            .cornerRadius(15)
                            .hCenter()
                            .padding(.horizontal,20)
                        
                        VStack(alignment: .center, spacing: 16){
                            
                            ForEach(tableHeadings, id: \.self) { item in
                                Button {
                                    
                                    ButtonClicked = item.title
                                    print(ButtonClicked)
                                    
                                    
                                } label: {
                                    NavigationLink(destination: PHealthRecordsUploadView(healthrecord: [
                                        HealthRecord(id: 1, name: "Lipid Profile", appointmentTime: DateComponents(year: 2023, month: 3, day: 12, hour: 09, minute: 34, second: 0) , patient: Patient(id: 1, age: 28 , gender: .female, bloodGroup: "AB+", height: 160.0, weight: 80), doctor: Doctor(id: 1, age: 65, gender: .male), type: .labreports, document: ""),
                                        HealthRecord(id: 1, name: "Complete Blood Count", appointmentTime: DateComponents(year: 2022, month: 12, day: 4, hour: 16, minute: 34, second: 0) , patient: Patient(id: 1, age: 28 , gender: .female, bloodGroup: "AB+", height: 160.0, weight: 80), doctor: Doctor(id: 1, age: 65, gender: .male), type: .labreports, document: ""),
                                        HealthRecord(id: 1, name: "Cholestrol-Serum", appointmentTime: DateComponents(year: 2022, month: 10, day: 8, hour: 13, minute: 34, second: 0) , patient: Patient(id: 1, age: 28 , gender: .female, bloodGroup: "AB+", height: 160.0, weight: 80), doctor: Doctor(id: 1, age: 65, gender: .male), type: .labreports, document: ""),
                                        HealthRecord(id: 1, name: "H1PVC Test", appointmentTime: DateComponents(year: 2021, month: 12, day: 4, hour: 16, minute: 34, second: 0) , patient: Patient(id: 1, age: 28 , gender: .female, bloodGroup: "AB+", height: 160.0, weight: 80), doctor: Doctor(id: 1, age: 65, gender: .male), type: .labreports, document: ""),
                                        HealthRecord(id: 1, name: "Gall Bladder Test", appointmentTime: DateComponents(year: 2021, month: 12, day: 4, hour: 16, minute: 34, second: 0) , patient: Patient(id: 1, age: 28 , gender: .female, bloodGroup: "AB+", height: 160.0, weight: 80), doctor: Doctor(id: 1, age: 65, gender: .male), type: .labreports, document: "")
                                    ], heading: item.title) ) {
                                        HStack(alignment: .center, spacing: 12){
                                            
                                            Image(systemName: item.image).resizable()
                                                .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                                                .frame(width: 40, height: 40)
                                            
                                            VStack(alignment: .leading){
                                                Text(item.title).font(.system(size: 17)).bold()
                                                    .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                                                    .padding(1)
                                                Text(item.description).font(.system(size: 15)).foregroundColor(Color.gray)
                                                
                                            }
                                        }
                                        Image(systemName: "chevron.right").foregroundColor(Color.gray).padding(.leading, 35)
                                        
                                    }.padding(.leading, 10)//tableviewcell
                                    
                                }
                                Divider().frame(width: 314)
                                    .padding(.leading, 30)
                            }
                        }//tableView
                    }
                }
                Spacer(minLength: 200)
                
            }//main VStack
            .navigationTitle("Health Records")
        }
    }
    func HeaderView() -> some View {
        HStack{
            VStack(alignment: .leading) {
                Text("Health Records").font(.largeTitle.bold())
                    .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                    .padding(.all, 10)
            }
            .hLeading()
        }// end of HeaderView() function
    }
    
    struct DetailView: View {
        var body: some View {
            Text("Detail view")
        }
    }
    struct PHealthRecords_Previews: PreviewProvider {
        static var previews: some View {
            var sectionHeadings : [HealthRecordType] = [
                HealthRecordType(id: 1, title: "Prescriptions", category: .prescription, image: "stethoscope.circle.fill" , description: "All your details in one place"),
                HealthRecordType(id: 2, title: "Lab Reports", category: .labreports, image: "doc.circle.fill" , description: "All your details in one place"),
                HealthRecordType(id: 3, title: "Vaccination Reports", category: .vaccinationreports, image: "syringe.fill" , description: "All your details in one place"),
                HealthRecordType(id: 4, title: "Hospitalizations", category: .hospitalization, image: "bed.double.circle.fill" , description: "All your details in one place")
            ]
            PHealthRecords(tableHeadings: sectionHeadings)
        }
    }
    
}
