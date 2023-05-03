//
//  ReminderCard.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 02/05/23.
//
import SwiftUI

struct ReminderCard: View {
    var medType: String
    var medName: String
    var time: String
    var dose: String
    var tags : String
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: medType).font(.system(size: 40)).padding(.horizontal, 5)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(medName)
                    .font(.title3.bold())
                Text(time).font(.body).fontWeight(.light)
            }
            Spacer()
            VStack(alignment: .center, spacing: 5) {
               
                Text(dose).font(.title3).fontWeight(.heavy)
                Text(tags).font(.subheadline).fontWeight(.light)
                
            }.frame(width: 60, height: 60)
            .background(.white)
            .cornerRadius(10)
        }
        .padding(15)
        .frame(height: 90)
        .foregroundColor(Color("Heading"))
        .background(Color("Secondary"))
        .cornerRadius(17)
    }
    
    private struct Tag: View {
        var text: String
        
        var body: some View {
            Text(text)
                .font(.caption2.weight(.semibold))
                .padding(5)
                .background(Color("Tag"))
                .foregroundColor(Color.white)
             
        }
    }
}

struct ReminderCard_Preview: PreviewProvider {
    static var previews: some View {
        ReminderCard(medType: "pills.fill",medName: "Rantadine 500mg", time: "Before breakfast", dose: "04", tags:"Tablet")
    }
}
