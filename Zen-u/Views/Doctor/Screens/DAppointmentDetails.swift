//
//  DAppointmentDetails.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI

var numberOfCapsules: [Int] = [1, 2, 3, 4, 5]



struct DAppointmentDetails: View {
    
    var user = User(id: 2023007, name: "Jonathan Cole", email: "jonathan@gmail.com", userType: .patient, profileImage: "dummy profile image", mobileNumber: "+91 8017217468")
    var patient = Patient(id: 2023007, age: 32, gender: .male , bloodGroup: "AB+", height: 160, weight: 80)
    
    @State var statusIndex: Int = 0
    var statusSelections: [String] = ["Active Medication", "Records"]
    
    @State var typeIndex: Int = 0
    var typeSelections: [String] = ["Scheduled", "Completed"]
    
    @State private var isExpanded: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing){
                VStack(alignment: .leading , spacing: 10){
                    
                    HStack( spacing: 20){
                        ViewButton(text: "9:41 pm", lIcon: "clock.fill")
                        
                        ZStack {
                            Menu {
                                ForEach(typeSelections.indices, id: \.self) {type in
                                    Button(typeSelections[type], action: {typeIndex = type})
                                }
                            } label: {
                                ViewButton(text: typeSelections[typeIndex], selectable: true, rIcon: "chevron.down")
                            }
                            
                        }
                    }
                    .padding(.bottom, 35)
                    
                    HStack(spacing: 12) {
                        Image(user.profileImage)
                            .resizable()
                            .aspectRatio(1.5, contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .cornerRadius(120)
                        
                        VStack(alignment: .leading, spacing: 18) {
                            VStack(alignment: .leading, spacing: 5) {
                                
                                Text(user.name)
                                    .font(.callout.bold())
                                
                                VStack(alignment: .leading, spacing: 3) {
                                    Text(String(patient.age) + " years old")
                                    switch patient.gender {
                                    case .male:
                                        Text("Male")
                                    case .female:
                                        Text("Female")
                                    case .others:
                                        Text("Other")
                                        
                                    }
                                }
                            }
                            
                            HStack(spacing: 10) {
                                Text(patient.bloodGroup)
                                    .padding(10)
                                    .background(Color(red: 1.0, green: 1.0, blue: 1.0))
                                    .cornerRadius(30)
                                
                                Text(String(patient.height))
                                    .padding(10)
                                    .background(Color(red: 1.0, green: 1.0, blue: 1.0))
                                    .cornerRadius(30)
                                
                                Text(String(patient.weight) + " kg")
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
                    .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                    .cornerRadius(15)
                    
                    
                    SegmentedPicker($statusIndex, selections: statusSelections)
                        .padding(.top, 35)
                    
                    if statusIndex == 0 {
                        Active_Medication()
                    } else if statusIndex == 1 {
                        Records()
                    }
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .navigationTitle("Appointment Details")
                
                VStack {
                    if typeSelections[typeIndex] == "Completed" {
                        if isExpanded == true {
                            Button(action: {isExpanded = true}) {
                                Image.init(systemName: "plus")
                                    .font(.title2)
                                    .frame(width: 50, height: 50)
                                    .background(Color.accentColor)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(25)
                            }
                            Button(action: {isExpanded = true}) {
                                Image.init(systemName: "plus")
                                    .font(.title2)
                                    .frame(width: 50, height: 50)
                                    .background(Color.accentColor)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(25)
                            }
                            Button(action: {isExpanded = true}) {
                                Image.init(systemName: "plus")
                                    .font(.title2)
                                    .frame(width: 50, height: 50)
                                    .background(Color.accentColor)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(25)
                            }
                            Button(action: {isExpanded = false}) {
                                Image.init(systemName: "multiply")
                                    .font(.title2)
                                    .frame(width: 50, height: 50)
                                    .background(Color("Secondary"))
                                    .foregroundColor(Color("Heading"))
                                    .cornerRadius(25)
                            }
                        } else {
                            Button(action: {isExpanded = true}) {
                                Image.init(systemName: "plus")
                                    .font(.title2)
                                    .frame(width: 50, height: 50)
                                    .background(Color.accentColor)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(25)
                            }
                        }
                    }
                    
                }
            }.padding()
        }
    }
}


struct DAppointmentDetails_Previews: PreviewProvider {
    static var previews: some View {
        DAppointmentDetails()
    }
}


struct Active_Medication : View{
    var body: some View{
        
        ScrollView{
            ForEach(numberOfCapsules, id: \.self)
            {
                numberOfCapsule in
                VStack(alignment: .leading) {
                    HStack {
                        Image("Capsule")
                            .padding(.leading)
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Vitamins")
                                .font(.system(size: 17).weight(.semibold))
                            
                            Text("\(numberOfCapsule)x a day")
                                .font(.system(size: 15).weight(.regular))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                }
                Divider()
                    .frame(width: 314)
            }.padding(.top, 13)
        }
        .frame(width: 346, height: 164)
        .background(Color("Secondary"))
        .cornerRadius(10)
        .padding(.vertical, 20)
        
    }
}


struct Records : View{
    
    @State var typeIndex1: Int = 0
    var typeSelections1: [String] = ["All", "Lab Reports", "Vaccinations", "Prescriptions", "Follow-ups"]
    
    var body: some View{
        
        HStack(){
            
            ZStack {
                Menu {
                    ForEach(typeSelections1.indices, id: \.self) {type in
                        Button(typeSelections1[type], action: {typeIndex1 = type})
                    }
                } label: {
                    ViewButton(text: typeSelections1[typeIndex1], rIcon: "chevron.down")
                }
            }
            
            Button(action: {}, label: {
                ViewButton(text: "View All", selectable: true)}).hTrailing()
        }
        .padding(.top, 20)
        
        ScrollView{
            ForEach(numberOfCapsules, id: \.self)
            {
                numberOfCapsule in
                VStack(alignment: .leading) {
                    HStack {
                        Image("doc.text.magnifyingglass")
                            .padding(.leading)
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Lipid Profile")
                                .font(.system(size: 17).weight(.semibold))
                            
                            Text("12th March 2023")
                                .font(.system(size: 15).weight(.regular))
                                .foregroundColor(.gray)
                        }
                        Image(systemName: "chevron.forward")
                            .foregroundColor(Color(UIColor.tertiaryLabel))
                            .hTrailing()
                        
                        Spacer()
                    }
                }
                Divider()
                    .frame(width: 314)
            }.padding(.top, 13)
        }
        .frame(width: 346, height: 154)
        .background(Color("Secondary"))
        .cornerRadius(10)
        .padding(.vertical, 20)
        
        
    }
}
