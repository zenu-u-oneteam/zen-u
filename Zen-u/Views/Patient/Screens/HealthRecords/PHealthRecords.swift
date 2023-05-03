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
                    Text("All Health Documents")
                        .font(.title3.bold())
                        .hLeading()
                        .padding(20)
                        .padding(.top, 40)
                        .foregroundColor(Color("Heading"))
                    
                    VStack(alignment: .center, spacing: 16){
                        
                        ForEach(tableHeadings, id: \.self) { item in
                            Button {
                                
                                ButtonClicked = item.title
                                print(ButtonClicked)
                                
                            } label: {
                                NavigationLink(destination: PHealthRecordsUploadView(heading: item.title) ) {
                                    HStack(alignment: .center, spacing: 12) {
                                        
                                        Image(systemName: item.image)
                                            .resizable()
                                            .foregroundColor(Color("Heading"))
                                            .frame(width: 40, height: 40)
                                        
                                        VStack(alignment: .leading){
                                            Text(item.title)
                                                .font(.headline.bold())
                                                .foregroundColor(Color("Heading"))
                                                .padding(1)
                                            Text(item.description)
                                                .font(.subheadline)
                                                .foregroundColor(Color("Subheadings"))
                                        }
                                    }
                                    .padding(.leading, 20)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color("Subheadings"))
                                        .padding(.leading, 35)
                                        .padding(.trailing, 20)
                                }//tableviewcell
                            }
                            Divider()
                                .padding(.horizontal, 30)
                        }//tableView
                    }
                    .padding(.vertical, 20)
                    .background(Color("Secondary"))
                    .cornerRadius(15)
                    .padding(.horizontal, 20)
                }
                Spacer(minLength: 200)
                
            }//main VStack
            .navigationTitle("Health Records")
        }
    }
    
    struct DetailView: View {
        var body: some View {
            Text("Detail view")
        }
    }
}

struct PHealthRecords_Previews: PreviewProvider {
    static var previews: some View {
        let sectionHeadings : [HealthRecordType] = [
            HealthRecordType(id: "1", title: "Appointment Reports", category: .appointmentRecords, image: "stethoscope.circle.fill" , description: "All your details in one place"),
            HealthRecordType(id: "2", title: "Lab Reports", category: .labreports, image: "doc.circle.fill" , description: "All your details in one place"),
            HealthRecordType(id: "3", title: "Vaccination Reports", category: .vaccinationreports, image: "syringe.fill" , description: "All your details in one place"),
            HealthRecordType(id: "4", title: "Hospitalizations", category: .hospitalization, image: "bed.double.circle.fill" , description: "All your details in one place")
        ]
        PHealthRecords(tableHeadings: sectionHeadings)
    }
}
