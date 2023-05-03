//
//  POnboarding.swift
//  Zen-u
//
//  Created by Aakriti Rawat on 02/05/23.
//

import Foundation
import SwiftUI

struct POnboarding: View {
    
    @StateObject private var viewModel = ViewModel()
    
    @State private var patient: Patient
    @State private var user: User
//    @State private var name = ""
//    @State private var gender = ""
//    let genderSelection = ["Male", "Female", "Other"]
//    @State private var bloodGroup = ""
//    let bloodGroupSelection = ["A+"]
    @State private var dateOfBirth =  Date()
//    @State private var height = ""
//    @State private var weight = ""
    @State private var phoneNumber = ""
//    @State private var email = ""
    @State private var aadhaar = ""
//    @State private var present = true
//    @State private var records = []
    
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    VStack(alignment: .leading, spacing: 30){
                        
                        HStack{
                            Text("Name")
                            TextField("", text: $patient.name).frame(height: 30)
                                .padding(5)
                                .background(Color("Secondary"))
                                .cornerRadius(5)
                                
                        }
                    
                        HStack{
                            Text("Gender")
                            Picker("Select", selection: $patient.gender){
                                ForEach(patient.gender, id: \.self) {
                                                    Text($0)
                                }
                            }.background(Color("Secondary"))
                                .cornerRadius(5)
                                .accentColor(Color("Heading"))
                            
                            Spacer()
                            
                            Text("Blood Group")
                            Picker("Select", selection: $patient.bloodGroup){
                                ForEach(patient.bloodGroup, id: \.self) {
                                                    Text($0)
                                }
                            }.background(Color("Secondary"))
                                .cornerRadius(5)
                                .accentColor(Color("Heading"))
                        }
                        
                        HStack{
                            Text("Date of Birth")
                            DatePicker("Date of Birth", selection: $dateOfBirth, displayedComponents: .date).labelsHidden()
                        }
                        
                        HStack{
                            Text("Height")
                            TextField("", text: $patient.height).frame(height: 30)
                                .padding(5)
                                .background(Color("Secondary"))
                                .cornerRadius(5)
                            
                            Text("Weight")
                            TextField("", text: $patient.weight).frame(height: 30)
                                .padding(5)
                                .background(Color("Secondary"))
                                .cornerRadius(5)
                        }
                        
                        HStack{
                            Text("Phone Number")
                            TextField("", text: $user.phoneNumber).frame(height: 30)
                                .padding(5)
                                .background(Color("Secondary"))
                                .cornerRadius(5)
                        }
                        
                        HStack{
                            Text("Email id")
                            TextField("", text: $user.email).frame(height: 30)
                                .padding(5)
                                .background(Color("Secondary"))
                                .cornerRadius(5)
                        }
                        
                        HStack{
                            Text("Aadhaar Number")
                            TextField("", text: $aadhaar).frame(height: 30)
                                .padding(5)
                                .background(Color("Secondary"))
                                .cornerRadius(5)
                        }
                        
                        HStack{
                            Text("Medical Records")
                            Button (action: {
                                // Perform signup action here
                            }, label: {
                                Text("Upload")
                            }).fileImporter(isPresented: $present, allowedContentTypes: [.pdf], allowsMultipleSelection: true){ result in
                                switch result {
                                case .success(let url):
                                    print(url)
                                case .failure(let error):
                                    print(error)
                                }
                            }
                        }
                        
                    }
                }
                
                Spacer()
                
                Button(action: {
                    Task {
                        await viewModel.sendPatientInfo()
                    }
                }){
                    Text("Continue").foregroundColor(Color("Primary"))
                        .frame(width:335, height:47)
                        .background(Color("AccentColor"))
                        .cornerRadius(14)
                }
                
            }.padding(.horizontal, 25)
                .padding(.vertical, 20)
                .navigationTitle("Patient Onboarding")

        }
    }
}

struct POnboarding_Previews: PreviewProvider {
    static var previews: some View {
        POnboarding()
    }
}

