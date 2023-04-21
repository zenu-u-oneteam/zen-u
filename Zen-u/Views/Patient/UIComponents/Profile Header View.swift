//
//  Profile Header View.swift
//  Zen-u
//
//  Created by Aindrila Ray on 21/04/23.
//

import SwiftUI

var patient = Patient(id: 2023007, name: "Jonathan Cole", age: 32, gender: .male , bloodGroup: "AB+", height: 160.0, weight: 80.0)

struct Profile_Header_View: View {
    
     
    
    var image = Image("dummy profile image")
    var name = patient.name
    var age = patient.age
    var gender = patient.gender
    var bloodGroup = patient.bloodGroup
    var height = patient.height
    var weight = patient.height
    
    
    var body: some View {
        
        HStack(spacing: 20){
            Image("dummy profile image")
                     .resizable()
                    .aspectRatio( 1.5, contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .cornerRadius(120)
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title).bold()
                HStack(spacing: 15) {
                    switch gender {
                    case .male:
                        Text("Male").font(.title).bold()
                    case .female:
                        Text("Female").font(.title).bold()
                    case .others:
                        Text("Other").font(.title).bold()
                    }
                    Text(String(age))
                        .font(.title).bold()
                }
            }
            
                
            
            
             
                     
                    
    
            
        }
        
        
        
        
    }
}

struct Profile_Header_View_Previews: PreviewProvider {
    static var previews: some View {
        Profile_Header_View()
    }
}
