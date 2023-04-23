//
//  Profile Header View.swift
//  Zen-u
//
//  Created by Aindrila Ray on 21/04/23.
//

import SwiftUI

var user = User(id: 2023007, name: "Jonathan Cole", email: "jonathan@gmail.com", password: "12345", userType: .patient, profileImage: "dummy profile image", mobileNumber: "+91 8017217468")
var patient = Patient(id: 2023007, name: "Jonathan Cole", age: 32, gender: .male , bloodGroup: "AB+", height: 160, weight: 80)
struct Profile_Header_View: View {
    
     
    
    var image = Image(user.profileImage)
    var name = patient.name
    var age = patient.age
    var gender = patient.gender
    var bloodGroup = patient.bloodGroup
    var height = patient.height
    var weight = patient.weight
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 32) {
            
            
            HStack(spacing: 16){
                   image
                    .resizable()
                    .aspectRatio( 1.5, contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .cornerRadius(120)
                VStack(alignment: .leading, spacing: 18){
                    VStack(alignment: .leading, spacing: 5) {
                        
                        Text(name)
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text(String(age) + " years old")
                                .font(.system(size: 14))
                                .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                            switch gender {
                            case .male:
                                Text("Male")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                            case .female:
                                Text("Female")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                            case .others:
                                Text("Other")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                                
                            }
                        }
                    }
                    
                    
                    HStack(spacing: 10){
                        Text(bloodGroup)
                            .font(.system(size: 14))
                            .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                            .padding(10)
                            .background(Color(red: 1.0, green: 1.0, blue: 1.0))
                            .cornerRadius(30)
                        
                        
                        Text(String(height))
                            .font(.system(size: 14))
                            .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                            .padding(10)
                            .background(Color(red: 1.0, green: 1.0, blue: 1.0))
                            .cornerRadius(30)
                        Text(String(weight) + " kg")
                            .font(.system(size: 14))
                            .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                            .padding(10)
                            .background(Color(red: 1.0, green: 1.0, blue: 1.0))
                            .cornerRadius(30)
                        
                        
                        
                    }
                    
                    
                    
                }
                
                
                
                
                
                
                
                
                
            }
            .padding(18)
            .background(Color(red: 0.94, green: 0.94, blue: 0.94))
            .cornerRadius(15)
            .padding(10)
            
            HStack(alignment: .center, spacing: 14){
                
                HStack(alignment: .center, spacing: 5){
                    
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
                        .font(.system(size: 13))
                        .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                        .padding(5)
                }
                
                HStack(alignment: .center, spacing: 5){
                    
                    ZStack{
                        
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
                        .font(.system(size: 13))
                        .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                        .padding(5)
                }
                
            }.padding(18)
                .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                .cornerRadius(15)
                .padding(10)
            
        }
        
        
        
    }
    
}
struct Profile_Header_View_Previews: PreviewProvider {
    static var previews: some View {
        Profile_Header_View()
    }
}

