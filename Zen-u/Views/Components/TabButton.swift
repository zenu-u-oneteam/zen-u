//
//  TabButton.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 21/04/23.
//

import SwiftUI

struct TabButton: View {
    var text: String
    var selected: Bool = true
    var fullWidth: Bool = true
    
    var body: some View {
        HStack{
            Text(text)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(selected ? .white : Color("Heading"))
                .padding(.horizontal, 25)
        }
        .frame(minWidth: (fullWidth) ? 350 : 175, minHeight: 50)
        .background(selected ? Color("Accent") : Color("Secondary"))
        .cornerRadius(10)
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        TabButton(text: "Continue")
    }
}
