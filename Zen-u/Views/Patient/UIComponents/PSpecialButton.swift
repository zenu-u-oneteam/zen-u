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
                RoundedRectangle(cornerRadius: 60)
                    .foregroundColor(buttonColor)
                    .frame(width: 105, height: 44)
                    .background(Color.blue, in: RoundedRectangle(cornerRadius: 25))
                Text(buttonText).fontWeight(.semibold).foregroundColor(.white)
                
            } else {
                RoundedRectangle(cornerRadius: 60)
                    .frame(width: 105, height: 44)
                    .foregroundColor(Color("Secondary"))
                
                Text(buttonText)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Heading"))
                
            }
        }.padding(.vertical, 5)
    }
}

struct PSpecialButton_Previews: PreviewProvider {
    static var previews: some View {
        PSpecialButton()
    }
}
