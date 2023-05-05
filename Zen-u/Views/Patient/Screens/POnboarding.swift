//
//  POnboarding.swift
//  Zen-u
//
//  Created by Aakriti Rawat on 02/05/23.
//

import Foundation
import SwiftUI

struct POnboarding: View {
    let userName: String
    let email: String
    
    let bloodGroupSelection = ["A+","A-","B+","B-","AB+","AB-","O+","O-"]
    @StateObject private var viewModel: ViewModel
    @State private var present = true
    @State private var isShowingImagePicker = false
    
    init(userName: String, email: String) {
        self.userName = userName
        self.email = email
        self._viewModel = StateObject(wrappedValue: ViewModel(userName: userName, email: email))
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    VStack(alignment: .leading, spacing: 30){
                        HStack{
                            Text("Gender")
                            Picker("Select", selection: $viewModel.patient.gender) {
                                ForEach(Patient.Gender.allCases, id: \.self) {
                                    gender in
                                    Text(gender.rawValue)
                                        .tag(gender.rawValue)
                                }
                            }.background(Color("Secondary"))
                                .cornerRadius(5)
                                .accentColor(Color("Heading"))
                        }
                            
                        HStack{
                            Text("Blood Group")
                            Picker("Select", selection: $viewModel.patient.bloodGroup){
                                ForEach(bloodGroupSelection, id: \.self) {
                                    Text($0)
                                }
                            }.background(Color("Secondary"))
                                .cornerRadius(5)
                                .accentColor(Color("Heading"))
                        }
                        
                        HStack{
                            Text("Date of Birth")
                            DatePicker("Date of Birth", selection: $viewModel.dateOfBirth, displayedComponents: .date).labelsHidden()
                        }
                        
                        HStack{
                            Text("Height")
                            TextField("", text: $viewModel.height).frame(height: 30)
                                .padding(5)
                                .background(Color("Secondary"))
                                .cornerRadius(5)
                                .keyboardType(.decimalPad)
                        }
                        
                        HStack{
                            Text("Weight")
                            TextField("", text:$viewModel.weight).frame(height: 30)
                                .padding(5)
                                .background(Color("Secondary"))
                                .cornerRadius(5)
                                .keyboardType(.decimalPad)
                        }
                        
                        HStack{
                            Text("Phone Number")
                            TextField("", text: $viewModel.user.mobileNumber)
                                .frame(height: 30)
                                .padding(5)
                                .background(Color("Secondary"))
                                .cornerRadius(5)
                                .keyboardType(.phonePad)
                        }
                        
                        HStack{
                            Text("Aadhaar Number")
                            TextField("", text: $viewModel.aadhaar).frame(height: 30)
                                .padding(5)
                                .background(Color("Secondary"))
                                .cornerRadius(5)
                                .keyboardType(.numberPad)
                        }
                        
                    }.onTapGesture {
                        self.hideKeyboard()
                    }
                }
                
                Spacer()
                
                Button {
                    viewModel.addingPatient()
                } label: {
                    ActionButton(text: "Continue", disabled: (viewModel.height.isEmpty || viewModel.weight.isEmpty || viewModel.user.mobileNumber.isEmpty || viewModel.aadhaar.isEmpty))
                }
                .disabled(viewModel.height.isEmpty || viewModel.weight.isEmpty || viewModel.user.mobileNumber.isEmpty || viewModel.aadhaar.isEmpty)
                
            }
            
            .padding(.horizontal, 25)
                .padding(.vertical, 20)
                .navigationTitle("Patient Onboarding")
                .navigationDestination(isPresented: $viewModel.canContinue, destination: {
                    PMain()
                })
            
        }
    }
}

struct POnboarding_Previews: PreviewProvider {
    static var previews: some View {
        POnboarding(userName: "", email: "")
    }
}
