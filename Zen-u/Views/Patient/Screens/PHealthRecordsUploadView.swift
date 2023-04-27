//
//  PHealthRecordsUploadView.swift
//  Zen-u
//
//  Created by Aindrila Ray on 27/04/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct PHealthRecordsUploadView: View {
    var healthrecord: [HealthRecord]
    var selections = ["Pending", "Past"]
    @State var statusIndex: Int = 1
    @State private var searchText = ""
    
    @State private var ButtonClicked = "Prescriptions"
    var body: some View {
        
            
            VStack(alignment: .leading){
                
                SegmentedPicker($statusIndex, selections: selections).padding()
                    .padding(.bottom, 20)
                    .padding(.top, 20)
//                Button {
//                    print(selections[statusIndex])
//                }
//                label :{
//                    Text("Yay")
//
//
//                }
//
                     
                ScrollView{
                    ZStack{
                        Rectangle()
                            .frame(width: .infinity, height: 400)
                            .foregroundColor(Color("Secondary"))
                            .cornerRadius(15)
                            .hLeading()
                            .padding(.horizontal,20)
//                            .padding(.top, 15)
                        VStack(alignment: .leading, spacing: 16){
                            
                            ForEach(healthrecord, id: \.self) { item in
                                //                        let calendar = Calendar.current
                                //                        let date = calendar.date(from: item.appointmentTime)
                                
                                Button {
                                    
                                    ButtonClicked = item.name
                                    print(ButtonClicked)
                                    
                                } label: {
                                    HStack(alignment: .center, spacing: 12){
                                        
                                        Image(systemName: "doc.circle.fill").resizable()
                                            .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                                            .frame(width: 40, height: 40)
                                        
                                        VStack(alignment: .leading){
                                            Text(item.name).font(.system(size: 17)).bold()
                                                .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                                                .padding(1)
                                                 
                                            Text(Date.now, format: .dateTime.day().month().year()).font(.system(size: 15)).foregroundColor(Color.gray).padding(.leading, 2)
                                            
                                        }
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right").foregroundColor(Color.gray)
                                        
                                        //                                        .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
                                        //                                                }
                                        
                                    }//tableviewcell
                                    .padding(.horizontal, 40)
//                                    .padding(.top, 12)
                                    
                                    
                                }
                                Divider().frame(width: 314)
                                    .padding(.leading, 30)
//                                    .padding(.top, 12)
                            }
                        }.padding(.top, 12)
                    }//tableView
                }//Scrollview end
                Button{
                    
                } label: {
                    TabButton(text: "Upload New").padding()
                    
                }
                
                
            }//initial Vstack
            
            
            
            
       
    }
}

struct PHealthRecordsUploadView_Previews: PreviewProvider {
    static var previews: some View {
        let calendar = Calendar.current
        let components = DateComponents(year: 2023, month: 4, day: 27, hour: 12, minute: 0, second: 0)
        let date = calendar.date(from: components)
        var healthRecords : [HealthRecord] = [
            HealthRecord(id: 1, name: "Lipid Profile", appointmentTime: components , patient: Patient(id: 1, age: 28 , gender: .female, bloodGroup: "AB+", height: 160.0, weight: 80), doctor: Doctor(id: 1, age: 65, gender: .male), type: .labreports, document: ""),
            HealthRecord(id: 1, name: "Complete Blood Count", appointmentTime: components , patient: Patient(id: 1, age: 28 , gender: .female, bloodGroup: "AB+", height: 160.0, weight: 80), doctor: Doctor(id: 1, age: 65, gender: .male), type: .labreports, document: ""),
            HealthRecord(id: 1, name: "Cholestrol-Serum", appointmentTime: components , patient: Patient(id: 1, age: 28 , gender: .female, bloodGroup: "AB+", height: 160.0, weight: 80), doctor: Doctor(id: 1, age: 65, gender: .male), type: .labreports, document: ""),
            HealthRecord(id: 1, name: "H1PVC Test", appointmentTime: components , patient: Patient(id: 1, age: 28 , gender: .female, bloodGroup: "AB+", height: 160.0, weight: 80), doctor: Doctor(id: 1, age: 65, gender: .male), type: .labreports, document: ""),
            HealthRecord(id: 1, name: "Gall Bladder Test", appointmentTime: components , patient: Patient(id: 1, age: 28 , gender: .female, bloodGroup: "AB+", height: 160.0, weight: 80), doctor: Doctor(id: 1, age: 65, gender: .male), type: .labreports, document: "")
        ]
        
        PHealthRecordsUploadView(healthrecord: healthRecords)
    }
}



