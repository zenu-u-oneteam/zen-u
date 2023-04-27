//
//  SpecialistModelView.swift
//  Zen-u
//
//  Created by Prakhar Singh on 25/04/23.
//

import SwiftUI

let departments = ["Skin Specialist" , "Neurology" , "Oncology", "Allergist and Clinical Immunologist" , "Psychiatry" ,"Sexual Health" ,"Gyanecology", "ENT" , "Cardiology" , "Diabetology" , "Othopaedics" , "Urology" , "Pediatrics" ]

struct SpecialistModelView: View {
    @Binding var isShowing: Bool
    @State private var offset: CGFloat = 200.0
    var body: some View {
        ZStack(alignment: .bottom){
            if isShowing {
                Color.black.opacity(0.3).ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                SpecalistContent(isShowing: $isShowing)
            }
            
        }
        .frame(maxWidth: .infinity ,maxHeight: .infinity ,alignment: .bottom)
            .ignoresSafeArea()
            .animation(Animation.easeInOut, value: offset)
    }
}

struct SpecalistContent: View {
    @Binding var isShowing : Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack{
                Spacer()
                Image(systemName: "xmark").background(
                    Circle()
                        .fill(Color("Primary"))
                        .frame(width: 40, height: 40)
                    
                ).onTapGesture {
                    isShowing = false
                }
                
                
            }.padding(24)
            HStack(spacing: 8){
                DepartmentLabel(labelText: departments[0])
                DepartmentLabel(labelText: departments[1])
                DepartmentLabel(labelText: departments[2])
            }
            HStack {
                DepartmentLabel(labelText: departments[3])
                DepartmentLabel(labelText: departments[4])
            }
            HStack(spacing: 8){
                DepartmentLabel(labelText: departments[5])
                DepartmentLabel(labelText: departments[6])
                DepartmentLabel(labelText: departments[7])
            }
            HStack(spacing: 8){
                DepartmentLabel(labelText: departments[8])
                DepartmentLabel(labelText: departments[9])
                DepartmentLabel(labelText: departments[10])
            }
            HStack() {
                DepartmentLabel(labelText: departments[11])
                DepartmentLabel(labelText: departments[12])
            }
        
            Spacer()
            
            
        }
        .padding(16)
            .frame(height: 450)
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
            //        SpecialistModelView(isShowing: .constant(true))
            PBookingAppointments()
        }
    }

struct DepartmentLabel: View {
    @State var labelText : String
    var body: some View {
        Button{} label: { Text(labelText)
                .font(.system(size: 13 , weight: .semibold))
                .padding(16)
            .foregroundColor(.black).background(RoundedRectangle(cornerRadius: 50).fill(Color("Primary")).frame(height: 44)) }
        
    }
}
