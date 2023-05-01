//
//  BookingAppointments.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI

struct PBookingAppointments: View {
    @State var symtomText: String = ""
    @State var showModel: Bool = false
    @State var selectedConsltType : consltType = consltType.general
    @State var isDeptSelected : Bool = false
    @State var selectedDeptText : String = "none"
    
    var body: some View {
        
            ZStack {
                VStack(alignment: .leading){
                    
                    Text("Choose Type of Doctor")
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                        .padding(.bottom , 20)
                    
                    HStack (spacing: 16){
                        RoundedRectangle(cornerRadius: 60)
                        
                            .foregroundColor(selectedConsltType == consltType.general ? Color("Accent") : Color("Secondary"))
                            .frame(width: 150 , height: 50)
                            .overlay(Text("General")
                                .font(.callout)
                                .foregroundColor(selectedConsltType == consltType.general ? .white : Color("Heading"))).onTapGesture {
                                    selectedConsltType = consltType.general
                                    isDeptSelected = false
                                    selectedDeptText = "none"
                                }
                        RoundedRectangle(cornerRadius: 60)
                        
                            .foregroundColor(selectedConsltType == consltType.specailist ? Color("Accent") : Color("Secondary"))
                            .frame(width: 150 , height: 50)
                            .overlay(Text("Specialist")
                                .font(.callout)
                                .foregroundColor(selectedConsltType == consltType.specailist ? .white : Color("Heading"))).onTapGesture {
                                    self.selectedConsltType = consltType.specailist
                                    self.showModel = true
                                }
                        
                    }
                    .padding(.bottom , 60)
                    .onTapGesture {
                        showModel = true
                        print("Tapped")
                    }
                    if isDeptSelected {
                        DeptSummary(heading: $selectedDeptText , description: "The oncology department in a hospital is dedicated to the diagnosis, treatment, and management of cancer patients.")
                        

                    }else{
                        GeneralDetails(symtomText: $symtomText)
                    }
                    
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        NavigationLink(destination: PScheduleSettings()) {
                            TabButton(text: "Continue")
                        }
                    }
                }
                .padding(24)
                SpecialistModelView(isShowing: $showModel , isDeptSelected: $isDeptSelected, selectedConsltType : $selectedConsltType , selectedDeptText : $selectedDeptText)
            }
            .navigationTitle("Booking Consultation")
        
    }
}
enum consltType{
    case general
    case specailist
}

struct DeptSummary: View {
    @Binding var heading : String
    @State var description : String
    var body: some View {
        VStack(alignment: .leading){
            Text("About Department")
                                .fontWeight(.semibold)
                                .font(.system(size: 20))
                                .padding(.bottom,30)
                            
                            HStack {
                                Circle().fill(Color("Subheadings")).frame(width: 75 , height: 75)
                                VStack(alignment : .leading , spacing: 8){
                                    Text("\(heading) Department").fontWeight(.bold)
                                    Text(description)
                                }.padding(.init(top: 0, leading: 8, bottom: 0, trailing: 8))
                            }
                            .padding(.init(top: 24, leading: 16, bottom: 24, trailing: 16))
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("Secondary")))
        }
    }
}

struct GeneralDetails: View {
    @Binding var symtomText: String
    var body: some View {
        VStack(alignment: .leading){
            Text("Specify Reason (if Any)")
                .fontWeight(.semibold)
                .font(.system(size: 20))
                .padding(.bottom,30)
            
            ZStack (alignment: .leading) {
                
                TextEditor(text: $symtomText)
                    .font(.body.weight(.light))
                    .onTapGesture {
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
    }
}
struct PBookingAppointments_Previews: PreviewProvider {
    static var previews: some View {
        PBookingAppointments()
    }
}
