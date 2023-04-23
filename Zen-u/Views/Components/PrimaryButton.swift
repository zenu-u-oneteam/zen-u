//
//  PrimaryButton.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 21/04/23.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var selected: Bool = false
    
    var body: some View {
        HStack(spacing: 13){
            Text(text)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(selected ? .white : Color("Heading"))
                .frame(minWidth: 70)
                .padding(.horizontal, 25)
        }
        .frame(minWidth: 100, minHeight: 50)
        .background(selected ? Color("Accent") : Color("Secondary"))
        .cornerRadius(60)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Oncology")
    }
}
