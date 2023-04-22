//
//  AppointmentCard.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 22/04/23.
//

import SwiftUI

struct AppointmentCard: View {
    var text: String
    var highlited: Bool = false
    var tags : [String] = ["Live", "General"]
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("PSV23 (Pneumo)")
                    .font(.body.weight(.semibold))
                HStack {
                    ForEach(tags, id:  \.self) {tag in
                        Tag(text: tag, highlited: highlited)
                    }
                }
                .padding(.top, 3.0)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("9:30")
                    .font(.largeTitle.bold())
                Text("Dr. Hanna Fiegel")
                    .font(.subheadline.bold())
            }
        }
        .padding()
        .frame(width: 350)
        .foregroundColor(highlited ? .white : Color("Heading"))
        .background(highlited ? Color("Accent") : Color("Secondary"))
        .cornerRadius(17)
    }
    
    private struct Tag: View {
        var text: String
        var highlited: Bool
        
        var body: some View {
            HStack {
                Text(text)
                    .font(.footnote.weight(.semibold))
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(highlited ? (text != "Live") ? Color.white.opacity(0.9) : Color.white : Color.white)
            .foregroundColor((text == "Live") ? Color.red : highlited ? Color("Accent") : Color("Heading"))
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke((text == "Live") ? .red : .white, lineWidth: 3)
            )
            .cornerRadius(5)
        }
    }
}

struct AppointmentCard_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentCard(text: "Continue")
    }
}
