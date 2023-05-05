//
//  PConsultationAppointments.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct PConsultationAppointments: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        
        ZStack {
            
            VStack {
                ScrollView {
                    VStack(alignment: .leading){
                        
                        Text("Choose Type of Doctor")
                            .font(.title3.weight(.semibold))
                            .padding(.bottom, 20)
                        
                        HStack(spacing: 16){
                            Text("General")
                                .font(.callout.weight(.semibold))
                                .foregroundColor(viewModel.selectedConsltType == ConsltType.general ? .white : Color("Heading"))
                                .frame(width: 150 , height: 50)
                                .background(viewModel.selectedConsltType == ConsltType.general ? Color("Accent") : Color("Secondary"))
                                .cornerRadius(60)
                                .onTapGesture {
                                    viewModel.selectedConsltType = ConsltType.general
                                    viewModel.isDeptSelected = false
                                    viewModel.selectedDeptText = "none"
                                }

                            Text("Specialist")
                                .font(.callout.weight(.semibold))
                                .foregroundColor(viewModel.selectedConsltType == ConsltType.specailist ? .white : Color("Heading"))
                                .frame(width: 150 , height: 50)
                                .background(viewModel.selectedConsltType == ConsltType.specailist ? Color("Accent") : Color("Secondary"))
                                .cornerRadius(60)
                                .onTapGesture {
                                    viewModel.selectedConsltType = ConsltType.specailist
                                    viewModel.showModel = true
                                    self.hideKeyboard()
                                }
                        }
                        .padding(.bottom, 60)
                        .onTapGesture {
                            viewModel.showModel = true
                            print("Tapped")
                        }
                        if viewModel.isDeptSelected {
                            DeptSummary(heading: $viewModel.selectedDeptText , description: "The oncology department in a hospital is dedicated to the diagnosis, treatment, and management of cancer patients.")
                            
                        } else {
                            GeneralDetails(symtomText: $viewModel.symtomText)
                        }
                        
                        Spacer(minLength: 100)
                        
                        Button {
                            viewModel.slotSelection()
                        } label: {
                            TabButton(text: "Continue")
                        }
                    }
                    .padding(24)
                }
            }
            SpecialistModelView(isShowing: $viewModel.showModel , isDeptSelected: $viewModel.isDeptSelected, selectedConsltType : $viewModel.selectedConsltType , selectedDeptText : $viewModel.selectedDeptText)
        }
        .navigationTitle("Booking Consultation")
        .navigationBarTitleDisplayMode(.large)
        .onTapGesture {
            self.hideKeyboard()
        }
        .navigationDestination(isPresented: $viewModel.isSelected, destination: {
            PSlotSelection(reason: viewModel.symtomText, department: viewModel.department, appointmentType: viewModel.appointmentType)
        })
        
    }
}

enum ConsltType{
    case general
    case specailist
}

struct DeptSummary: View {
    @Binding var heading : String
    @State var description : String
    var body: some View {
        VStack(alignment: .leading){
            Text("About Department")
                .font(.title3.weight(.semibold))
                .padding(.bottom,30)
            
            HStack {
                Circle()
                    .fill(Color("Subheadings"))
                    .frame(width: 75 , height: 75)
                VStack(alignment : .leading , spacing: 8){
                    Text("\(heading) Department")
                        .font(.callout.bold())
                    Text(description)
                        .font(.footnote)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 24)
            .background(Color("Secondary"))
            .cornerRadius(15)
        }
    }
}

struct GeneralDetails: View {
    @Binding var symtomText: String
    var body: some View {
        VStack(alignment: .leading){
            Text("Specify Reason (if Any)")
                .font(.title3.weight(.semibold))
                .padding(.bottom, 30)
            
            ZStack (alignment: .leading) {
                
                TextEditor(text: $symtomText)
                    .font(.body.weight(.light))
                    .onTapGesture {
                        self.hideKeyboard()
                        if symtomText == "Mention any symptoms..." {
                            symtomText = ""
                        }
                    }
                
                if symtomText.isEmpty {
                    Text("Mention any symptoms...")
                        .foregroundColor(Color("Heading"))
                        .font(.body.weight(.light))
                        .padding(.horizontal, 4)
                        .padding(.top, -76)
                }
            }
            .padding()
            .frame(height: 200.0)
            .colorMultiply(Color("Secondary"))
            .background(Color("Secondary"))
            .cornerRadius(26)
            .overlay(
                RoundedRectangle(cornerRadius: 26)
                    .stroke(Color("Secondary"), lineWidth: 1)
            )
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

struct PConsultationAppointments_Previews: PreviewProvider {
    static var previews: some View {
        PConsultationAppointments()
    }
}
