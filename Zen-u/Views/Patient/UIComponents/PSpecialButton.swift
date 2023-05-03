//
//  PSpecialButton.swift
//  Zen-u
//
//  Created by Archit Khanna on 20/04/23.
//

import SwiftUI

struct PSpecialButton: View {
    var buttonText = "1"
    var buttonColor = Color("Blue")
    var active = false
    
    var body: some View {
        
        ZStack{
            
            if active {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(buttonColor)
                    .frame(width: 107, height: 35)
                    .background(Color.blue, in: RoundedRectangle(cornerRadius: 25))
                Text(buttonText).bold().foregroundColor(.white)
                
            } else {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 107, height: 35)
                    .foregroundColor(Color("Secondary"))
                
                Text(buttonText)
                    .bold()
                    .foregroundColor(Color("Heading"))
                
            }
        }
    }
}

struct PSpecialButton_Previews: PreviewProvider {
    static var previews: some View {
        PSpecialButton()
    }
}
