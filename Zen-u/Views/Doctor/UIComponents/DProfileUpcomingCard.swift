//
//  DProfileUpcomingCard.swift
//  Zen-u
//
//  Created by Prakhar Singh on 04/05/23.
//

import SwiftUI

struct DProfileUpcomingCard: View {
    var patientName: String
    var tags : [String]
    var time: String
    var age: Int
    var gender: String
    
    var body: some View {
        HStack(alignment: .top) {
            
//            Spacer()
            
            HStack{
                VStack(alignment: .center){
                    ZStack{
                        Circle()
                            .fill(.white)
                            .frame(width: 70, height: 70)
                        Image("Image")
                            .resizable()
                            .frame(width: 55, height: 50)
                        
                    }
                    HStack {
                        ForEach(tags, id:  \.self) {tag in
                            Tag(text: tag)
                        }
                    }
//                    .frame(width: 100)
                    
                }
                
                VStack(alignment: .leading){
                    Text(patientName)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Heading"))
                    Text("\(age)")
                        .font(.callout)
                        .foregroundColor(Color("Subheadings"))
                    Text(gender)
                        .font(.callout)
                        .foregroundColor(Color("Subheadings"))
                }
                
                .padding(.top, -20)
            }
//            VStack(alignment: .leading, spacing: 5) {
//                Image("Image")
//                    .resizable()
//                    .frame(width: 55, height: 50)
//                Text(patientName)
//                    .font(.callout.bold())
//                    .foregroundColor(Color("Heading"))
//                Text("Age: \(age) years")
//                    .font(.caption2)
//                Text("Gender: \(gender)")
//                    .font(.caption2)
//            }
//            .foregroundColor(Color("Subheadings"))
//            .padding(.trailing, 10)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 5) {
                HStack{
                    Image(systemName: "clock")
                        .foregroundColor(.accentColor)
                    Text(time)
                        .foregroundColor(.accentColor)
                        .font(.callout.weight(.light))
                }
//                .padding()
                
            }
            
        }
        .padding()
        .frame(width: 295)
        .foregroundColor(Color("Heading"))
        .background(Color("Secondary"))
        .cornerRadius(20)
    }
    
    private struct Tag: View {
        var text: String
        
        var body: some View {
            Text(text)
                .font(.caption2.weight(.semibold))
                .padding(.horizontal, 5)
                .padding(.vertical, 5)
                .background(Color("Tag"))
                .foregroundColor(Color.white)
                .cornerRadius(5)
        }
    }
}

struct DProfileUpcomingCard_Previews: PreviewProvider {
    static var previews: some View {
        DProfileUpcomingCard(patientName: "Stefania Keller", tags: ["General"], time: "9:30", age: 30, gender: "Female")
    }
}
