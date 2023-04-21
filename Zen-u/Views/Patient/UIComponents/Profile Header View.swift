//
//  Profile Header View.swift
//  Zen-u
//
//  Created by Aindrila Ray on 21/04/23.
//

import SwiftUI

var patient = Patient(id: 2023007, name: "Jonathan Cole", age: 32, gender: .male , bloodGroup: "AB+", height: 160.0, weight: 80.0)

struct Profile_Header_View: View {
    
     
    
    var image = URL(string: "https://unsplash.com/photos/pRLLvgZ1Is4")
    var name = patient.name
    
    
    var body: some View {
        
        
        
        
    }
}

struct Profile_Header_View_Previews: PreviewProvider {
    static var previews: some View {
        Profile_Header_View()
    }
}
