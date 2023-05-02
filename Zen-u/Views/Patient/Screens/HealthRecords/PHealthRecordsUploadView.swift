//
//  PHealthRecordsUploadView.swift
//  Zen-u
//
//  Created by Aindrila Ray on 27/04/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct PHealthRecordsUploadView: View {
    
    @State var path: NavigationPath = NavigationPath()
    @StateObject private var viewModel = ViewModel()
    
//    var healthrecord: [HealthRecord]
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
        if(statusIndex == 1){
            
        }
        NavigationStack(path: $path){
            VStack {
                if(heading == "Lab Reports" || heading == "Vaccination Reports"){
                    SegmentedPicker($statusIndex, selections: selections)
                        .padding()
                        .padding(.vertical, 20)
                }
                
                ScrollView {
                    ZStack(alignment: .topLeading) {
                        Rectangle()
                            .frame(height: 420)
                            .foregroundColor(Color("Secondary"))
                            .cornerRadius(15)
                            .hLeading()
                            .padding(.horizontal,20)
                        if(statusIndex == 1) {
                            if(viewModel.healthRecords.count > 0 ){
                                VStack(alignment: .leading, spacing: 16) {
                                    
                                    ForEach(viewModel.healthRecords, id: \.self) { item in
                                        
                                        if(item.type?.category == heading){
                                            
                                            Button {
                                                ButtonClicked = item.name
                                                print(ButtonClicked)
                                                //                                            print(item.type?.category)
                                            } label: {
                                                NavigationLink(destination: CustomPDFView(title: item.name, url: item.document)) {
                                                    HStack(alignment: .top, spacing: 12) {
                                                        Image(systemName: item.type?.image ?? "doc.circle.fill").resizable()
                                                            .foregroundColor(Color("Heading"))
                                                            .frame(width: 40, height: 40)
                                                            .padding(.top, 10)
                                                        
                                                        
                                                        VStack(alignment: .leading) {
                                                            Text(item.name)
                                                                .font(.headline.bold())
                                                                .foregroundColor(Color("Heading"))
                                                                .padding(1)
//                                                                .padding(.top, 10)
                                                            
                                                            
                                                            Text(formattedDateComponents(dateComponents: item.appointmentTime))
                                                                .font(.subheadline)
                                                                .foregroundColor(Color("Subheadings"))
                                                                .padding(.leading, 2)
                                                        }
                                                        Spacer()
                                                        
                                                        Image(systemName: "chevron.right")
                                                            .foregroundColor(Color("Subheadings"))
                                                            .padding(.top, 10)
                                                        
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
                                }.hLeading()
                            }//tableView
                        }
                        else {
                            
                            if(viewModel.pendingHealthRecords.count > 0 ){
                                VStack(alignment: .leading, spacing: 16) {
                                    
                                    ForEach(viewModel.pendingHealthRecords, id: \.self) { item in
                                        
                                        if(item.type?.category == heading){
                                            
                                            Button {
                                                ButtonClicked = item.name
                                                print(ButtonClicked)
                                                //                                            print(item.type?.category)
                                            } label: {
//                                                NavigationLink(destination: CustomPDFView(title: item.name, url: item.document)) {
                                                    HStack(alignment: .top, spacing: 12) {
                                                        Image(systemName: item.type?.image ?? "doc.circle.fill").resizable()
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
                                                        
//                                                        Image(systemName: "chevron.right")
//                                                            .foregroundColor(Color("Subheadings"))
//                                                            .padding(.top, 10)
                                                    
                                                }//tableviewcell
                                                .padding(.horizontal, 40)
                                            }
                                            Divider()
                                                .frame(width: 314)
                                                .padding(.leading, 30)
                                        }
                                    }
                                    .padding(.top, 12)
                                }.hLeading()
                            }//tableView
                            
                           
                        }
                        
                        
                    }
                }//Scrollview end
                if(statusIndex == 1 && (heading == "Lab Reports" || heading == "Vaccination Reports")) {
                    
                    DocumentPickerCustom()
                        .padding()
                        .padding(.bottom, 20)
                }
                    
                }//initial Vstack
                .navigationTitle(heading)
                .foregroundColor(Color("Heading"))
            }
        
    }
}

struct PHealthRecordsUploadView_Previews: PreviewProvider {
    static var previews: some View {
        PHealthRecordsUploadView(heading: "Lab Reports")
        
    }
}
