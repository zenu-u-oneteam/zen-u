//
//  DScheduleTask.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 25/04/23.
//

import SwiftUI

struct DScheduleTaskCard: View {
    var patientName: String
    var tags : [String]
    var time: String
    var age: Int
    var gender: String
    
    var body: some View {
        HStack(alignment: .top ) {
            VStack(alignment: .leading, spacing: 15) {
                Text(time)
                    .font(.largeTitle.weight(.heavy))
                HStack {
                    ForEach(tags, id:  \.self) {tag in
                        Tag(text: tag)
                    }
                }
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 5) {
                Text(patientName)
                    .font(.callout.bold())
                    .foregroundColor(Color("Heading"))
                Text("Age: \(age) years")
                    .font(.caption2)
                Text("Gender: \(gender)")
                    .font(.caption2)
            }
            .foregroundColor(Color("Subheadings"))
            .padding(.trailing, 10)
        }
        .padding(10)
//        .frame(width: 295)
        .foregroundColor(Color("Heading"))
        .background(Color("Secondary"))
        .cornerRadius(20)
    }
    
    private struct Tag: View {
        var text: String
        
        var body: some View {
            Text(text)
                .font(.caption2.weight(.semibold))
                .padding(4)
                .background(Color("Tag"))
                .foregroundColor(Color.white)
                .frame(height: 16)
                .cornerRadius(5)
        }
    }
}

struct DScheduleTaskCard_Previews: PreviewProvider {
    static var previews: some View {
        DScheduleTaskCard(patientName: "Stefania Keller", tags: ["New patient", "Operation"], time: "9:30", age: 30, gender: "Female")
    }
}
