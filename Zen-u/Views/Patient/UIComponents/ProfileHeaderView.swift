//
//  ProfileHeaderView.swift
//  Zen-u
//
//  Created by Aindrila Ray on 27/04/23.
//

import SwiftUI
import Firebase

var patient: Patient = Patient(id: "1", age: 32, gender: .male, bloodGroup: .OPositive, height: 160.0, weight: 60.0)
var user : User = User(id: "1", name: "Aindrila Ray", email: "aindrila@gmail.com", userType: .patient, profileImage: "dummy profile image", mobileNumber: "+91 8017217468")


struct ProfileHeaderView: View {
    
    
    
    @EnvironmentObject var appState: AppState
    
    
    @State var alert = false
    
    @State private var name = user.name
    @State private var age = String(patient.age)
    @State private var isEditing = false
    
    @State private var image = Image(user.profileImage)
    @State private var gender = patient.gender.rawValue.codingKey.stringValue
    @State private var bloodGroup = patient.bloodGroup.rawValue.codingKey.stringValue
    @State private var height = String(patient.height)
    @State private var weight = String(patient.weight)
    @State private var phonenumber = user.mobileNumber
    @State private var email = user.email
    
    @State var showMenu = false
    @State private var selectedOption = "Option 1"
    @State var userType: UserType = .none
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 32) {
            
            Menu {
                Button(action: {
                    isEditing = true
                    
                }) {
                    Text("Edit")
                }
                Button("Settings") {
                    self.selectedOption = "Option 2"
                }
                Button("Log Out") {
                    self.selectedOption = "Option 3"
                    print("LOGOUT!!!")
                    UserDefaults.standard.removeObject(forKey: "currentUser")
                    appState.rootViewId = UUID()
                }
            }
        label: {
            Image(systemName: "line.horizontal.3")
                .resizable()
                .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                .frame(width: 15, height: 13)
                .padding(.all, 20)
        }.hTrailing()
                .padding()
            
            HStack(spacing: 16) {
                image
                    .resizable()
                    .aspectRatio(1.5, contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .cornerRadius(120)
                VStack(alignment: .leading, spacing: 18) {
                    VStack(alignment: .leading, spacing: 5) {
                        
                        TextField("Name", text: $name)
                            .disabled(!isEditing)
                        
                        
                            .font(.callout.bold())
                            .padding(.bottom, 5)
                        VStack(alignment: .leading, spacing: 3) {
                            HStack{
                                Text("Age:").padding(.leading, 3).fontWeight(.semibold)
                                
                                TextField("Age (in years)", text: $age) .keyboardType(.numberPad)
                                    .disabled(!isEditing)
                                    .padding(.leading, 3)
                            }
                            
                            HStack{
                                Text("Gender:").padding(.leading, 3).fontWeight(.semibold)
                                TextField("Gender", text: $gender)
                            }
                            HStack{
                                Text("Bloodgroup:").padding(.leading, 3).fontWeight(.semibold)
                                TextField("Blood", text: $bloodGroup)
                                    .padding(.leading, 3)
                                    .disabled(!isEditing)
                                
                            }
                            
                            
                            
                            //                                .background(Color(red: 1.0, green: 1.0, blue: 1.0))
                            //                                .cornerRadius(30)
                        }
                    }
                    
                    HStack(spacing: 10) {
                        
                        HStack (spacing: 1){
                            TextField("Height", text: $height).frame(width: 40)
                                .keyboardType(.numberPad)
                            Text("cm")
                        }.padding(10)
                            .background(Color(red: 1.0, green: 1.0, blue: 1.0))
                            .cornerRadius(10)
                        
                        HStack (spacing: 1){
                            TextField("Weight", text: $weight).frame(width: 35)
                                .keyboardType(.numberPad)
                            Text("kg")
                            
                        }.padding(10)
                            .background(Color(red: 1.0, green: 1.0, blue: 1.0))
                            .cornerRadius(10)
                        
                    }
                }
                .font(.system(size: 14))
                .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                
            }
            .padding(18)
            .background(Color(red: 0.94, green: 0.94, blue: 0.94))
            .cornerRadius(15)
            .padding(10)
            
            HStack(alignment: .center, spacing: 14) {
                
                HStack(alignment: .center, spacing: 5) {
                    
                    ZStack{
                        
                        Rectangle()
                            .frame(width: 28, height: 28)
                            .foregroundColor(Color("Accent"))
                            .cornerRadius(28)
                        Image(systemName: "phone.fill")
                            .resizable()
                            .foregroundColor(Color(red: 0.94, green: 0.94, blue: 0.94))
                            .padding(5)
                            .frame(width: 25, height: 25)
                    }
                    
                    TextField("Phone", text: $phonenumber).frame(width: 107)
                        .disabled(!isEditing)
                        .font(.footnote)
                        .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                        .padding(5)
                }
                
                HStack(alignment: .center, spacing: 5) {
                    
                    ZStack {
                        
                        Rectangle()
                            .frame(width: 28, height: 28)
                            .foregroundColor(Color("Accent"))
                            .cornerRadius(28)
                        Image(systemName: "envelope.fill")
                            .resizable()
                            .foregroundColor(Color(red: 0.94, green: 0.94, blue: 0.94))
                            .padding(5)
                            .frame(width: 25, height: 20)
                        
                    }
                    
                    TextField("Email ID", text: $email).frame(width: 130)
                        .disabled(!isEditing)
                        .font(.footnote)
                        .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                        .padding(5)
                }
                
                
                
                
            }//main VStack
            .padding(18)
            .background(Color(red: 0.94, green: 0.94, blue: 0.94))
            .cornerRadius(15)
            .padding(10)
            if isEditing{
                Button(action: {
                    
                    if let ageTest = Int(age){
                        patient.age = Int(age) ?? patient.age
                        
                        
                    }
                    else{
                        
                        
                        
                        self.alert = true
                        
                    }
                    if let heightTest = Float(height){
                        patient.height = Float(height) ?? patient.height
                        
                        
                    }
                    else{
                        
                        
                        
                        self.alert = true
                        
                    }
                    
                    if let weightTest = Float(weight){
                        patient.weight = Float(weight) ?? patient.weight
                        
                        
                    }
                    else{
                        self.alert = true
                        
                    }
                    if alert == false {
                        isEditing = false
                    }
                    
                }) {
                    TabButton(text: "Done").padding()
                }
                .alert(isPresented: $alert) {
                    Alert(
                        title: Text("Alert Title"),
                        message: Text("This is an alert message."),
                        dismissButton: .default(Text("OK"))
                    )
                }
                
                
            }
            
            
            
        }
    }
}



struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
