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
    
    func formattedDateComponents(dateComponents: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy 'at' h:mm a"
        return dateFormatter.string(from: dateComponents)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
                SegmentedPicker($statusIndex, selections: selections)
                    .padding()
                    .padding(.vertical, 20)
                
                ScrollView {
                    ZStack {
                        Rectangle()
                            .frame(height: 400)
                            .foregroundColor(Color("Secondary"))
                            .cornerRadius(15)
                            .hLeading()
                            .padding(.horizontal,20)
                        VStack(alignment: .leading, spacing: 16) {
                            ForEach(healthrecord, id: \.self) { item in
                                
                                Button {
                                    ButtonClicked = item.name
                                    print(ButtonClicked)
                                } label: {
                                    NavigationLink(destination: CustomPDFView(title: item.name, url: item.document)) {
                                        HStack(alignment: .center, spacing: 12) {
                                            Image(systemName: "doc.circle.fill").resizable()
                                                .foregroundColor(Color("Heading"))
                                                .frame(width: 40, height: 40)
                                            
                                            VStack(alignment: .leading) {
                                                Text(item.name)
                                                    .font(.headline.bold())
                                                    .foregroundColor(Color("Heading"))
                                                    .padding(1)
                                                
                                                Text(formattedDateComponents(dateComponents: item.appointmentTime))
                                                    .font(.subheadline)
                                                    .foregroundColor(Color("Subheadings"))
                                                    .padding(.leading, 2)
                                            }
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(Color("Subheadings"))
                                        }
                                    }//tableviewcell
                                    .padding(.horizontal, 40)
                                }
                                Divider()
                                    .frame(width: 314)
                                    .padding(.leading, 30)
                            }
                        }
                        .padding(.top, 12)
                    }//tableView
                }//Scrollview end
                DocumentPickerCustom()
                    .padding()
                    .padding(.bottom, 20)
                
            }//initial Vstack
            .navigationTitle(heading)
            .foregroundColor(Color("Heading"))
        }
    }
}

struct PHealthRecordsUploadView_Previews: PreviewProvider {
    static var previews: some View {
        let healthRecords : [HealthRecord] = [
            HealthRecord(id: "1", name: "Lipid Profile", appointmentTime: Date() , patient: "123", doctor: "123", type: .labreports, document: "https://www.africau.edu/images/default/sample.pdf"),
            HealthRecord(id: "1", name: "Complete Blood Count", appointmentTime: Date() , patient: "123", doctor: "123", type: .labreports, document: "https://www.africau.edu/images/default/sample.pdf"),
            HealthRecord(id: "1", name: "Cholestrol-Serum", appointmentTime: Date() , patient: "123", doctor: "123", type: .labreports, document: "https://www.africau.edu/images/default/sample.pdf"),
            HealthRecord(id: "1", name: "H1PVC Test", appointmentTime: Date() , patient: "123", doctor: "123", type: .labreports, document: "https://www.africau.edu/images/default/sample.pdf"),
            HealthRecord(id: "1", name: "Gall Bladder Test", appointmentTime: Date() , patient: "123", doctor: "123", type: .labreports, document: "https://www.africau.edu/images/default/sample.pdf")
        ]
        PHealthRecordsUploadView(healthrecord: healthRecords, heading: "Lab Reports")
    }
}
