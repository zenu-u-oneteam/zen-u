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
    
   var heading: String
    
    @State var statusIndex: Int = 1
    @State private var searchText = ""
    @State private var ButtonClicked = "none"
    
    let dateComponents = DateComponents(year: 2023, month: 4, day: 28, hour: 15, minute: 30)
    
    func formattedDateComponents(dateComponents: DateComponents) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy 'at' h:mm a"
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents) ?? Date()
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                
                SegmentedPicker($statusIndex, selections: selections).padding()
                    .padding(.bottom, 20)
                    .padding(.top, 20)
                
                ScrollView {
                    ZStack {
                        Rectangle()
                            .frame(width: .infinity, height: 400)
                            .foregroundColor(Color("Secondary"))
                            .cornerRadius(15)
                            .hLeading()
                            .padding(.horizontal,20)
                        
                        VStack(alignment: .leading, spacing: 16){
                            
                            ForEach(healthrecord, id: \.self) { item in
                                
                                Button {
                                    
                                    ButtonClicked = item.name
                                   
                                    print(ButtonClicked)
                                    
                                } label: {
                                    NavigationLink(destination:  CustomPDFView(title: item.name, url: item.document)) {
                                        HStack(alignment: .center, spacing: 12){
                                            
                                            Image(systemName: "doc.circle.fill").resizable()
                                                .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                                                .frame(width: 40, height: 40)
                                            
                                            VStack(alignment: .leading){
                                                Text(item.name).font(.system(size: 17)).bold()
                                                    .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                                                    .padding(1)
                                                
                                                Text(formattedDateComponents(dateComponents: item.appointmentTime)).font(.system(size: 15)).foregroundColor(Color.gray).padding(.leading, 2)
                                                
                                            }
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right").foregroundColor(Color.gray)
                                        }
                                        
                                    }
                                    //tableviewcell
                                    .padding(.horizontal, 40)
                                }
                                Divider().frame(width: 314)
                                    .padding(.leading, 30)
                            }
                        }.padding(.top, 12)
                    }//tableView
                }//Scrollview end
                DocumentPickerCustom().padding()
                    .padding(.bottom, 20)
                
            }//initial Vstack
            .navigationTitle(heading).foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
        }
    }
}

struct PHealthRecordsUploadView_Previews: PreviewProvider {
    static var previews: some View {
        var healthRecords : [HealthRecord] = [
            HealthRecord(id: 1, name: "Lipid Profile", appointmentTime: DateComponents(year: 2023, month: 3, day: 12, hour: 09, minute: 34, second: 0) , patient: Patient(id: 1, age: 28 , gender: .female, bloodGroup: "AB+", height: 160.0, weight: 80), doctor: Doctor(id: 1, age: 65, gender: .male), type: .labreports, document: "https://www.africau.edu/images/default/sample.pdf"),
            HealthRecord(id: 1, name: "Complete Blood Count", appointmentTime: DateComponents(year: 2022, month: 12, day: 4, hour: 16, minute: 34, second: 0) , patient: Patient(id: 1, age: 28 , gender: .female, bloodGroup: "AB+", height: 160.0, weight: 80), doctor: Doctor(id: 1, age: 65, gender: .male), type: .labreports, document: "https://www.africau.edu/images/default/sample.pdf"),
            HealthRecord(id: 1, name: "Cholestrol-Serum", appointmentTime: DateComponents(year: 2022, month: 10, day: 8, hour: 13, minute: 34, second: 0) , patient: Patient(id: 1, age: 28 , gender: .female, bloodGroup: "AB+", height: 160.0, weight: 80), doctor: Doctor(id: 1, age: 65, gender: .male), type: .labreports, document: "https://www.africau.edu/images/default/sample.pdf"),
            HealthRecord(id: 1, name: "H1PVC Test", appointmentTime: DateComponents(year: 2021, month: 12, day: 4, hour: 16, minute: 34, second: 0) , patient: Patient(id: 1, age: 28 , gender: .female, bloodGroup: "AB+", height: 160.0, weight: 80), doctor: Doctor(id: 1, age: 65, gender: .male), type: .labreports, document: "https://www.africau.edu/images/default/sample.pdf"),
            HealthRecord(id: 1, name: "Gall Bladder Test", appointmentTime: DateComponents(year: 2021, month: 12, day: 4, hour: 16, minute: 34, second: 0) , patient: Patient(id: 1, age: 28 , gender: .female, bloodGroup: "AB+", height: 160.0, weight: 80), doctor: Doctor(id: 1, age: 65, gender: .male), type: .labreports, document: "https://www.africau.edu/images/default/sample.pdf")
        ]
        PHealthRecordsUploadView(healthrecord: healthRecords, heading: "Lab Reports")
    }
}
