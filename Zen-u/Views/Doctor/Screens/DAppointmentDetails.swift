//
//  DAppointmentDetails.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI



struct DAppointmentDetails: View {
    @State var typeIndex1: Int = 0
    var typeSelections1: [String] = ["Lab Reports", "Vaccination Reports", "Appointments"]
    
    var appointmentDetails: AppointmentData
    @State var statusIndex: Int = 0
    var statusSelections: [String] = ["Active Medication", "Records"]
    
    @State var typeIndex: Int = 0
    var typeSelections: [String] = ["Scheduled", "Completed"]
    @StateObject private var viewModel: ViewModel
    
    init(appointmentDetails: AppointmentData) {
        self.appointmentDetails = appointmentDetails
        self._viewModel = StateObject(wrappedValue: ViewModel(appointmentDetails: appointmentDetails))
    }
    func formattedDateComponents(dateComponents: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy 'at' h:mm a"
        return dateFormatter.string(from: dateComponents)
    }
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .bottomTrailing){
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading , spacing: 10){
                        
                        HStack(spacing: 20){
                            ViewButton(text: formattedDateComponents(dateComponents: appointmentDetails.appointment.appointmentTime), lIcon: "clock.fill")
                            
                            ZStack {
                                Menu {
                                    ForEach(typeSelections.indices, id: \.self) { type in
                                        Button(typeSelections[type], action: {
                                            typeIndex = type
                                            
                                        })
                                    }
                                } label: {
                                    ViewButton(text: typeSelections[typeIndex], selectable: true, rIcon: "chevron.down")
                                }
                                
                            }
                        }
                        .padding(.bottom, 35)
                        
                        HStack(spacing: 12) {
                            Image(appointmentDetails.patientUser.profileImage)
                                .resizable()
                                .aspectRatio(1, contentMode: .fill)
                                .frame(width: 120, height: 120)
                                .cornerRadius(120)
                            
                            VStack(alignment: .leading, spacing: 18) {
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text(appointmentDetails.patientUser.name)
                                        .font(.callout.bold())
                                    
                                    VStack(alignment: .leading, spacing: 3) {
                                        Text(String(appointmentDetails.appointment.patient?.age ?? 21) + " years old")
                                        Text(appointmentDetails.appointment.patient?.gender ?? "Male")
                                        
                                        
                                    }
                                }
                                
                                
                                HStack(spacing: 10) {
                                    Text(appointmentDetails.appointment.patient?.bloodGroup ?? "AB-" )
                                        .padding(10)
                                        .background(Color(red: 1.0, green: 1.0, blue: 1.0))
                                        .cornerRadius(30)
                                    
                                    Text(String(appointmentDetails.appointment.patient?.height ?? 0.0 ))
                                        .padding(10)
                                        .background(Color(red: 1.0, green: 1.0, blue: 1.0))
                                        .cornerRadius(30)
                                    
                                    Text(String(appointmentDetails.appointment.patient?.weight ?? 0.0 ) + " kg")
                                        .padding(10)
                                        .background(Color(red: 1.0, green: 1.0, blue: 1.0))
                                        .cornerRadius(30)
                                }
                            }
                            .font(.system(size: 12).weight(.light))
                            .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                        }
                        .frame(width: 347, height: 160)
                        .padding(2)
                        .padding(.leading, 10)
                        .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                        .cornerRadius(15)
                        
                        
                        SegmentedPicker($statusIndex, selections: statusSelections)
                            .padding(.top, 35)
                        
                        if statusIndex == 0 {
                            Active_Medication(medication: viewModel.activeMedications)
                        }
                        else if statusIndex == 1 && (typeIndex1 == 1) {
                            HStack{
                                
                                ZStack {
                                    Menu {
                                        ForEach(typeSelections1.indices, id: \.self) {type in
                                            Button(typeSelections1[type], action: {typeIndex1 = type})
                                        }
                                    } label: {
                                        ViewButton(text: typeSelections1[typeIndex1], rIcon: "chevron.down")
                                    }
                                }
                                
                                Button {
                                    
                                } label: {
                                    NavigationLink(destination: DAppointmentViewAll(heading: typeSelections1[typeIndex1] , patientRecords: viewModel.patientRecords, appointmentRecords: viewModel.appointmentReports)){
                                        ViewButton(text: "View All", selectable: true).hTrailing()
                                    }
                                    
                                }
                            }
                            .padding(.top, 20)
                            
                            if(viewModel.patientRecords.count != 0) {
                                Button{
                                    
                                } label: {
                                    NavigationLink(destination: CustomPDFView(title: viewModel.firstVaccinationReport.name , url: viewModel.firstVaccinationReport.document, show: false)) {
                                        HStack (alignment: .center, spacing: 12){
                                            Image(systemName: viewModel.firstVaccinationReport.type?.image ?? "doc.text.magnifyingglass")
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                                .padding(.leading)
                                                .foregroundColor(Color("Heading"))
                                            
                                            VStack(alignment: .leading, spacing: 10) {
                                                Text(viewModel.firstVaccinationReport.name)
                                                    .font(.system(size: 16).weight(.semibold))
                                                    .padding(.leading, 10)
                                                    .hLeading()
                                                    .foregroundColor(Color("Heading"))
                                                    .frame(width: 200)
                                                
                                                Text(formattedDateComponents(dateComponents: viewModel.firstVaccinationReport.appointmentTime))
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
                                        .frame(width: 356)
                                        .padding(.vertical, 20)
                                        .background(Color("Secondary"))
                                        .cornerRadius(10)
                                        .padding(.vertical, 20)
                                        .padding(.leading, 3)
                                        
                                    }
                                }
                            }
                            else{
                                emptyDisplayMessage(message: "No health Records to display")
                            }
                            
                        }
                        
                        else if statusIndex == 1 && (typeIndex1 == 0) {
                            HStack{
                                
                                ZStack {
                                    Menu {
                                        ForEach(typeSelections1.indices, id: \.self) {type in
                                            Button(typeSelections1[type], action: {typeIndex1 = type})
                                        }
                                    } label: {
                                        ViewButton(text: typeSelections1[typeIndex1], rIcon: "chevron.down")
                                    }
                                }
                                
                                Button {
                                    
                                } label: {
                                    NavigationLink(destination: DAppointmentViewAll(heading: typeSelections1[typeIndex1] , patientRecords: viewModel.patientRecords, appointmentRecords: viewModel.appointmentReports)){
                                        ViewButton(text: "View All", selectable: true).hTrailing()
                                    }
                                    
                                }
                            }
                            .padding(.top, 20)
                            
                            if(viewModel.patientRecords.count != 0) {
                                Button{
                                    
                                } label: {
                                    NavigationLink(destination: CustomPDFView(title: viewModel.firstLabReport.name , url: viewModel.firstLabReport.document, show: false)) {
                                        HStack (alignment: .center, spacing: 12){
                                            Image(systemName: viewModel.firstLabReport.type?.image ?? "doc.text.magnifyingglass")
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                                .padding(.leading)
                                                .foregroundColor(Color("Heading"))
                                            
                                            VStack(alignment: .leading, spacing: 10) {
                                                Text(viewModel.firstLabReport.name)
                                                    .font(.system(size: 16).weight(.semibold))
                                                    .padding(.leading, 10)
                                                    .hLeading()
                                                    .foregroundColor(Color("Heading"))
                                                    .frame(width: 200)
                                                
                                                Text(formattedDateComponents(dateComponents: viewModel.firstLabReport.appointmentTime))
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
                                        .frame(width: 356)
                                        .padding(.vertical, 20)
                                        .background(Color("Secondary"))
                                        .cornerRadius(10)
                                        .padding(.vertical, 20)
                                        .padding(.leading, 3)
                                        
                                    }
                                }
                            }
                            else{
                                emptyDisplayMessage(message: "No health Records to display")
                            }
                            
                        }
                        else if statusIndex == 1 && typeIndex1 == 2  {
                            HStack{
                                
                                ZStack {
                                    Menu {
                                        ForEach(typeSelections1.indices, id: \.self) {type in
                                            Button(typeSelections1[type], action: {typeIndex1 = type})
                                        }
                                    } label: {
                                        ViewButton(text: typeSelections1[typeIndex1], rIcon: "chevron.down")
                                    }
                                }
                                
                                Button {
                                    
                                } label: {
                                    NavigationLink(destination: DAppointmentViewAll(heading: typeSelections1[typeIndex1], typeIndex1: 2, patientRecords: viewModel.patientRecords, appointmentRecords: viewModel.appointmentReports)){
                                        ViewButton(text: "View All", selectable: true).hTrailing()
                                    }
                                    
                                }
                            }
                            .padding(.top, 20)
                            if(viewModel.appointmentReports.count != 0) {
                                Button{
                                    
                                } label: {
                                    NavigationLink(destination: PAppointmentRecordView(appointmentRecord: viewModel.appointmentReports[0])) {
                                        HStack (alignment: .center, spacing: 12){
                                            Image(systemName: viewModel.appointmentReports[0].type?.image ?? "doc.text.magnifyingglass")
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                                .padding(.leading)
                                                .foregroundColor(Color("Heading"))
                                            
                                            VStack(alignment: .leading, spacing: 10) {
                                                Text(viewModel.appointmentReports[0].doctor?.name ?? "Dr. Doctor")
                                                    .font(.system(size: 16).weight(.semibold))
                                                    .padding(.leading, 10)
                                                    .hLeading()
                                                    .foregroundColor(Color("Heading"))
                                                    .frame(width: 200)
                                                
                                                Text(formattedDateComponents(dateComponents: viewModel.appointmentReports[0].appointmentTime))
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
                                        .frame(width: 356)
                                        .padding(.vertical, 20)
                                        .background(Color("Secondary"))
                                        .cornerRadius(10)
                                        .padding(.vertical, 20)
                                        .padding(.leading, 3)
                                        
                                    }
                                }
                                
                                
                                
                            }
                            else{
                                emptyDisplayMessage(message: "No health Records to display")
                            }
                            
                            
                        }// end of else if
                        
                    }
                }
                
            }
            .padding()
            .navigationTitle("Appointment Details")
            VStack(alignment: .trailing) {
                if typeSelections[typeIndex] == "Completed" {
                    Button {
                        
                    } label: {
                        NavigationLink(destination: DPatientRecordScreen()){
                            Image.init(systemName: "plus")
                                .font(.title2)
                                .frame(width: 50, height: 50)
                                .background(Color("Accent"))
                                .foregroundColor(Color.white)
                                .cornerRadius(25)
                        }
                        
                    }.hTrailing()
                        .padding(.vertical, 5)
                        .padding(.horizontal, 20)
                        .padding()
                }
                
            }//button
            
        }
        
        
        
    }
}


struct DAppointmentDetails_Previews: PreviewProvider {
    static var previews: some View {
        DAppointmentDetails(appointmentDetails: AppointmentData(appointment: Appointment(id: "111", appointmentTime: Date.now) , patientUser: User(name: "Aindrila Ray", email: "aindrila@gmail.com", userType: .patient, profileImage: "", mobileNumber: "+91 8017217468")))
    }
}


struct Active_Medication : View{
    
    var medication: [String]
    
    var body: some View{
        
        ScrollView(showsIndicators: false){
            ForEach(medication, id: \.self)
            {
                medicine in
                VStack(alignment: .leading, spacing: 16) {
                    HStack(alignment: .center, spacing: 12) {
                        Image("Capsule")
                            .padding(.leading)
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text(medicine)
                                .font(.system(size: 17).weight(.semibold))
                            
                            Text("1x a day")
                                .font(.system(size: 15).weight(.regular))
                                .foregroundColor(.gray)
                        }.hLeading()
                            .padding(.vertical, 10)
                        Spacer()
                    }
                }
                Divider()
                    .frame(width: 314)
            }.padding(.top, 13)
        }
        .frame(width: 360, height: 164)
        .background(Color("Secondary"))
        .cornerRadius(10)
        .padding(.vertical, 20)
        
    }
}


