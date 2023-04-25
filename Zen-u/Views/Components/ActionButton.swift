//
//  ActionButton.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 21/04/23.
//

import SwiftUI

struct ActionButton: View {
    var text: String
    var disabled: Bool = false
    
    var body: some View {
        HStack(spacing: 13){
            Text(text)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(minWidth: 70)
                .padding(.leading, 20)
                        
            Image(systemName: "arrow.right")
                .font(.callout)
                .frame(width: 30, height: 30)
                .foregroundColor(disabled ? Color.gray : Color("Heading"))
                .clipShape(Circle())
                .background(Color.white, in: Circle())
                .padding(.trailing, 10)
        }
        .frame(minWidth: 150, minHeight: 50)
        .background(disabled ? Color.gray : Color.black)
        .cornerRadius(60)
        .foregroundColor(.white)
        .overlay(RoundedRectangle(cornerRadius: 60).stroke(Color.white))
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(text: "Log in")
    }
}
