//
//  SpecialistModelView.swift
//  Zen-u
//
//  Created by Prakhar Singh on 25/04/23.
//

import SwiftUI

struct SpecialistModelView: View {
    @Binding var isShowing : Bool
    @Binding var isDeptSelected : Bool
    @Binding var selectedConsltType : consltType
    @Binding var selectedDeptText : String
    @State private var offset: CGFloat = 200.0
    
    var body: some View {
        ZStack(alignment: .bottom){
            if isShowing {
                Color.black.opacity(0.3).ignoresSafeArea()
                    .onTapGesture {
                        selectedConsltType = consltType.general
                        isDeptSelected = false
                        isShowing = false
                        selectedDeptText = "none"
                    }
                SpecalistContent(isShowing: $isShowing , isDeptSelected: $isDeptSelected  ,selectedDeptText : $selectedDeptText )
            }
        }
        .frame(maxWidth: .infinity ,maxHeight: .infinity ,alignment: .bottom)
        .ignoresSafeArea()
        .animation(Animation.easeInOut, value: offset)
    }
}

struct SpecalistContent: View {
    @Binding var isShowing : Bool
    @Binding var isDeptSelected : Bool
    @Binding var selectedDeptText : String
    
    let departments = ["Skin Specialist" , "Neurology" , "Oncology", "Allergist and Clinical Immunologist" , "Psychiatry" ,"Sexual Health" ,"Gyanecology", "ENT" , "Cardiology" , "Diabetology" , "Othopaedics" , "Urology" , "Pediatrics" ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Spacer()
                Image(systemName: "xmark")
                    .background(Circle()
                        .fill(Color("Primary"))
                        .frame(width: 40, height: 40))
                    .onTapGesture {
                        isDeptSelected = false
                        isShowing = false
                        selectedDeptText = "none"
                    }
            }
            .padding(24)
            
            HStack(spacing: 8) {
                DepartmentLabel(labelText: departments[0], isDeptSelected: $isDeptSelected, selectedDeptText: $selectedDeptText )
                DepartmentLabel(labelText: departments[1] , isDeptSelected: $isDeptSelected , selectedDeptText: $selectedDeptText)
                DepartmentLabel(labelText: departments[2] , isDeptSelected: $isDeptSelected , selectedDeptText: $selectedDeptText)
            }
            HStack {
                DepartmentLabel(labelText: departments[3],  isDeptSelected: $isDeptSelected, selectedDeptText: $selectedDeptText)
                DepartmentLabel(labelText: departments[4], isDeptSelected: $isDeptSelected , selectedDeptText: $selectedDeptText)
            }
            HStack(spacing: 8) {
                DepartmentLabel(labelText: departments[5],  isDeptSelected: $isDeptSelected , selectedDeptText: $selectedDeptText)
                DepartmentLabel(labelText: departments[6], isDeptSelected: $isDeptSelected, selectedDeptText: $selectedDeptText)
                DepartmentLabel(labelText: departments[7], isDeptSelected: $isDeptSelected, selectedDeptText: $selectedDeptText)
            }
            HStack(spacing: 8) {
                DepartmentLabel(labelText: departments[8], isDeptSelected: $isDeptSelected, selectedDeptText: $selectedDeptText)
                DepartmentLabel(labelText: departments[9], isDeptSelected: $isDeptSelected, selectedDeptText: $selectedDeptText)
                DepartmentLabel(labelText: departments[10], isDeptSelected: $isDeptSelected, selectedDeptText: $selectedDeptText)
            }
            HStack() {
                DepartmentLabel(labelText: departments[11], isDeptSelected: $isShowing, selectedDeptText: $selectedDeptText)
                DepartmentLabel(labelText: departments[12], isDeptSelected: $isShowing, selectedDeptText: $selectedDeptText)
            }
            
            Spacer()
            Button {
                if isDeptSelected {
                    isShowing = false
                }
            } label: {
            Text("OK").foregroundColor(isDeptSelected ? .white : .black )
                
            }
            .disabled(!isDeptSelected)
            .padding()
            .padding(.horizontal,122)
            .background(Color(isDeptSelected ? "Accent" : "Secondary" )
                .cornerRadius(10))
            .foregroundColor(.white)
            .hCenter()
            .padding(.bottom, 90 )
            
        }
        .padding(16)
        .frame(height: 510)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                Rectangle().frame(height: 450/2)
            }
            .foregroundColor(.white)
        )
        .transition(.move(edge: .bottom))
    }
}

struct SpecialistModelView_Previews: PreviewProvider {
    static var previews: some View {
        PBookingAppointments()
    }
}

struct DepartmentLabel: View {
    @State var labelText : String
    @Binding var isDeptSelected: Bool
    @Binding var selectedDeptText : String
    
    var body: some View {
        Button{
            if selectedDeptText == labelText {
                selectedDeptText = "none"
                isDeptSelected = false
            } else {
                selectedDeptText = labelText
                isDeptSelected = true
            }
        } label: {
            Text(labelText)
                .font(.footnote.weight(.semibold))
                .padding(16)
                .foregroundColor(Color("Heading"))
                .background(RoundedRectangle(cornerRadius: 50)
                    .fill(Color(selectedDeptText == labelText ? "Accent" : "Primary"))
                    .frame(height: 44))
        }
    }
}
