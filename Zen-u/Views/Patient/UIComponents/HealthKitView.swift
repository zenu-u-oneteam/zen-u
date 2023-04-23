//
//  HealthKitView.swift
//  Zen-u
//
//  Created by Aindrila Ray on 23/04/23.
//

import SwiftUI

struct HealthKitView: View {
    var body: some View {
        ZStack{
            
            Rectangle()
                .frame(width: 158, height: 151)
                 
                .foregroundColor(Color("AccentColor 1"))
                .cornerRadius(18)
            
            VStack(spacing: 22){
                
                Text("72 bpm")
                    .font(.system(size: 15))
                    .foregroundColor(Color(UIColor.white)).bold()
                    
                Image(systemName: "waveform.path.ecg")
                    .resizable()
                    .frame(width: 75, height: 66)
                    .foregroundColor(Color(UIColor.white))
                   
                Text("Heart Rate")
                    .font(.system(size: 15))
                    .foregroundColor(Color(UIColor.white)).bold()
                
            }
              
            
            
            
        }.padding()
       
        
       
        
    }
}

struct HealthKitView_Previews: PreviewProvider {
    static var previews: some View {
        HealthKitView()
    }
}
