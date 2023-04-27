//
//  ViewButton.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 21/04/23.
//

import SwiftUI

struct ViewButton: View {
    var text: String
    var selected: Bool = false
    var selectable: Bool = false
    var rIcon: String = "none"
    var lIcon: String = "none"
    
    var body: some View {
        HStack(spacing: 10){
            if lIcon != "none" {
                Image(systemName: lIcon)
            }

            Text(text)
                .font(.footnote)

            if rIcon != "none" {
                Image(systemName: rIcon)
            }
        }
        .padding(.horizontal, 10)
        .frame(minWidth: 60, minHeight: 30)
        .foregroundColor(selected ? .white : selectable ? Color("Accent") : Color("Heading"))
        .background(selected ? Color("Accent") : Color("Secondary"))
        .cornerRadius(10)
    }
}

struct ViewButton_Previews: PreviewProvider {
    static var previews: some View {
        ViewButton(text: "View All")
    }
}
