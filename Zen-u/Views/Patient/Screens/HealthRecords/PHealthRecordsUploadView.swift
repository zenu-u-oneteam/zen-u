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
            if viewModel.isLoading {
                ProgressView("Loading...")
            }else{
                if(heading == "Appointment Reports"){
                    if(viewModel.appointmentReports.count > 0 ){
                        VStack{
                        VStack(alignment: .leading){
                            Text("All Appointment Reports")
                                .font(.title3.bold())
                                .hLeading()
                                .padding(20)
                                .padding(.top, 40)
                                .foregroundColor(Color("Heading"))
                        }
                            ScrollView{
                                VStack(alignment: .center, spacing: 16) {
                                    ForEach(viewModel.appointmentReports, id: \.self) { item in
                                        
                                        Button{
                                            ButtonClicked = item.doctor?.name ?? "none"
                                            print(ButtonClicked)
                                            
                                            
                                        } label: {
                                            
                                            
                                            NavigationLink(destination: PAppointmentRecordView(appointmentRecord: item)) {
                                                HStack(alignment: .center, spacing: 12) {
                                                    Image(systemName: item.type?.image ?? "doc.circle.fill").resizable()
                                                        .foregroundColor(Color("Heading"))
                                                        .frame(width: 40, height: 40)
                                                    VStack(alignment: .leading) {
                                                        Text(item.doctor?.name ?? "none")
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
                                                        .padding(.top, 10)
                                                }
                                                    
                                                }.padding(.horizontal, 30)
                                            
                                            
                                        }
                                        Divider()
                                            .frame(width: 314)
                                            .padding(.leading, 30)
                                        
                                        
                                        
                                        
                                    }
                                    
                                }
                                .padding(.vertical, 20)
                                .background(Color("Secondary"))
                                .cornerRadius(15)
                                .padding(.horizontal, 15)
//                                .padding(.bottom, 30)
                            }
                            
                            
                        }
                        
                    }
                }
                if(heading == "Lab Reports" || heading == "Vaccination Reports") {
                   VStack{
                        SegmentedPicker($statusIndex, selections: selections)
                            .padding()
                            .padding(.vertical, 20)
                    }
                    
                    ScrollView {
                        if(statusIndex == 1) {
                            if(viewModel.healthRecords.count > 0 ){
                                VStack(alignment: .center, spacing: 16) {
                                    
                                    ForEach(viewModel.healthRecords, id: \.self) { item in
                                        
                                        if(item.type?.category == heading){
                                            
                                            Button {
                                                ButtonClicked = item.name
                                                print(ButtonClicked)
                                                          
                                            } label: {
                                                NavigationLink(destination: CustomPDFView(title: item.name, url: item.document, show: true)) {
                                                    HStack(alignment: .center, spacing: 12) {
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
                                                        
                                                        Image(systemName: "chevron.right")
                                                            .foregroundColor(Color("Subheadings"))
                                                            .padding(.top, 10)
                                                        
                                                    }
                                                }
                                                .padding(.horizontal, 40)
                                                
                                            }
                                            Divider()
                                                .frame(width: 314)
                                                .padding(.leading, 30)
                                        }
                                    }
                                    
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
                                            } label: {
                                                HStack(alignment: .center, spacing: 12) {
                                                    Image(systemName: item.type?.image ?? "doc.circle.fill").resizable()
                                                        .foregroundColor(Color("Heading"))
                                                        .frame(width: 40, height: 40)
                                                        .padding(.trailing, 10)
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
                                                }//tableviewcell
                                                .padding(.horizontal, 24)
                                        
                                            }
                                            Divider()
                                                .frame(width: 314)
                                                .padding(.leading, 30)
                                        }
                                    }
                                }
                            }//tableView

                        }
                        
                        
                    }.padding(.vertical, 20)
                        .background(Color("Secondary"))
                        .cornerRadius(15)
                        .padding(.horizontal, 15)
                        .padding(.bottom, 40)
                    
                    
                }
               
                //Scrollview end
                if(statusIndex == 1 && (heading == "Lab Reports" || heading == "Vaccination Reports")) {
                    
                    DocumentPickerCustom()
                        .padding()
                        .padding(.bottom, 20)
                }
            }
            
        }//initial Vstack
                .navigationTitle(heading)
                .foregroundColor(Color("Heading"))
        }
    
        
    }


struct PHealthRecordsUploadView_Previews: PreviewProvider {
    static var previews: some View {
        PHealthRecordsUploadView(heading: "Lab Reports")
        
    }
}
