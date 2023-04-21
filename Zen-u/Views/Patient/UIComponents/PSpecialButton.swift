//
//  PSpecialButton.swift
//  Zen-u
//
//  Created by Archit Khanna on 20/04/23.
//

import SwiftUI

struct PSpecialButton: View {
    var buttonText = "Time Slot"
    var buttonColor = Color("Blue")
    var active = false
    
    var body: some View{
        
        ZStack{
            if active {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(buttonColor)
                    .frame(width: 105, height: 35)
                    .background(Color.blue, in: RoundedRectangle(cornerRadius: 25))
                Text(buttonText).bold().foregroundColor(.white)
                    
            }
            else{
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 105, height: 35)
                    .foregroundColor(Color("Black"))
                    .background(Color(red: 239/255, green: 239/255, blue: 239/255), in: RoundedRectangle(cornerRadius: 25))
                
                Text(buttonText).bold().foregroundColor(Color(red: 140/255, green: 146/255, blue: 172/255))
                
            }
        }
        
    }
    
}
struct PSpecialButton_Previews: PreviewProvider {
    static var previews: some View {
        PSpecialButton()
    }
}

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}
