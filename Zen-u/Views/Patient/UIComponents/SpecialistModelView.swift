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
            
            ForEach(0 ..< departments.count/3) { i in
                HStack(spacing: 8) {
                    ForEach(0..<3) { j in
                        let index = i*3 + j
                        if index < departments.count {
                            DepartmentLabel(labelText: departments[index], isDeptSelected: $isDeptSelected, selectedDeptText: $selectedDeptText)
                        }
                    }
                }
            }

            Spacer()
            Button {
                if isDeptSelected {
                    isShowing = false
                }
            } label: {
                TabButton(text: "OK", selected: isDeptSelected)
            }
            .disabled(!isDeptSelected)
            .padding(.bottom, 90)
        }
        .padding(16)
        .frame(height: 510)
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

struct DepartmentLabel: View {
    @State var labelText : String
    @Binding var isDeptSelected: Bool
    @Binding var selectedDeptText : String
    
    var body: some View {
        Button {
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
                .foregroundColor(selectedDeptText == labelText ? Color("Secondary") : Color("Heading"))
                .background(Color(selectedDeptText == labelText ? "Accent" : "Primary"))
                .cornerRadius(50)
        }
    }
}

struct SpecialistModelView_Previews: PreviewProvider {
    static var previews: some View {
        PBookingAppointments()
    }
}
