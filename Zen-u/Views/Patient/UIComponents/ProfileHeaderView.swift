//
//  Profile Header View.swift
//  Zen-u
//
//  Created by Aindrila Ray on 21/04/23.
//

import SwiftUI
import Firebase


var user = User(id: "2023007", name: "Jonathan Cole", email: "jonathan@gmail.com", userType: .patient, profileImage: "dummy profile image", mobileNumber: "+91 8017217468")
var patient = Patient(id: 2023007, age: 32, gender: .male , bloodGroup: .ABPositive , height: 160, weight: 80)
struct ProfileHeaderView: View {
    
    @EnvironmentObject var appState: AppState
    @State private var name = user.name
    @State private var age = String(patient.age)
    @State private var isEditing = false
    
    @State private var image = Image(user.profileImage)
    @State private var gender = patient.gender
    @State private var bloodGroup = patient.bloodGroup.rawValue.codingKey.stringValue
    @State private var height = String(patient.height)
    @State private var weight = String(patient.weight)
    
    @State var showMenu = false
    @State private var selectedOption = "Option 1"
    @State var userType: UserType = .none
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 32) {
            
            Menu {
                Button("Edit") {
                    self.selectedOption = "Option 1"
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
                                
                                    .padding(.leading, 3)
                            }
                                
                            HStack{
                                Text("Gender:").padding(.leading, 3).fontWeight(.semibold)
                                switch gender {
                                case .male:
                                    Text("Male")
                                case .female:
                                    Text("Female")
                                case .others:
                                    Text("Other")
                                    
                                }
                            }
                            HStack{
                                Text("Bloodgroup:").padding(.leading, 3).fontWeight(.semibold)
                                TextField("Blood", text: $bloodGroup)
                                    .padding(.leading, 3)
                            }
                                
                               
                                 
//                                .background(Color(red: 1.0, green: 1.0, blue: 1.0))
//                                .cornerRadius(30)
                        }
                    }
                    
                    HStack(spacing: 10) {
                        
                        
                        TextField("Height (in cms)", text: $height)
                            .padding(10)
                            .background(Color(red: 1.0, green: 1.0, blue: 1.0))
                            .cornerRadius(30)
                        
                        Text(String(weight) + " kg")
                            .padding(10)
                            .background(Color(red: 1.0, green: 1.0, blue: 1.0))
                            .cornerRadius(30)
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
                    
                    Text(user.mobileNumber)
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
                    
                    Text(user.email)
                        .font(.footnote)
                        .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                        .padding(5)
                }
                
            }
            .padding(18)
            .background(Color(red: 0.94, green: 0.94, blue: 0.94))
            .cornerRadius(15)
            .padding(10)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
