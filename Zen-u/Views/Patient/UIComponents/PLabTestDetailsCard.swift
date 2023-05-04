//
//  PLabTestDetailsCard.swift
//  Zen-u
//
//  Created by Archit Khanna on 02/05/23.
//

import SwiftUI

func PLabTestDetailsCard(tName:String, testType:String, tDuration:String, tSample:String, gender:String, ageGroup:String) -> some View {
    return VStack(alignment: .leading, spacing: 10){
        HStack{
            Text(tName).font(.callout.weight(.semibold))
            
            Spacer()
            Text(testType)
                .font(.footnote)
                .foregroundColor(.accentColor)
                .frame(width: 74, height: 29)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
        }
        VStack(alignment: .leading ,spacing: 5){
            HStack{
                Image(systemName: "clock.fill").font(.footnote)
                Text("Get reports by: ").font(.footnote).foregroundColor(.secondary)
                Text(tDuration).font(.footnote).foregroundColor(.secondary)
            }
            HStack{
                Image(systemName: "syringe.fill").font(.footnote)
                Text("Sample: ").font(.footnote).foregroundColor(.secondary)
                Text(tSample).font(.footnote).foregroundColor(.secondary)
            }
            HStack{
                Image(systemName: "person.2.fill").font(.footnote)
                Text("Gender: ").font(.footnote).foregroundColor(.secondary)
                Text(gender).font(.footnote).foregroundColor(.secondary)
            }
            HStack{
                Image(systemName: "person.crop.circle.badge.checkmark").font(.footnote)
                Text("Age group: ").font(.footnote).foregroundColor(.secondary)
                Text(ageGroup).font(.footnote).foregroundColor(.secondary)
            }
        }
    }
    .padding(8)
    .frame(height: 170)
    .background(Color.gray.opacity(0.1))
    .cornerRadius(15)
    .padding()

        
        
}
struct PLabTestDetailsCard_Previews: PreviewProvider {
    static var previews: some View {
        PLabTestDetailsCard(tName: "Complete Blood Count (CBC)", testType: "Test", tDuration: "1 day", tSample: "Blood, Urine", gender: "not Specified", ageGroup: "All age groups")
    }
}
