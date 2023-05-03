//
//  PLabTestExpansionCard.swift
//  Zen-u
//
//  Created by Archit Khanna on 02/05/23.
//

import SwiftUI

func PLabTestExpansionCard(tName:String, testType:String, tDuration: String, tPrice:String) -> some View {
    return VStack(alignment: .leading, spacing: 20){
        
        VStack(alignment: .leading, spacing: 5) {
            HStack(spacing: 0){
                Text(tName).font(.callout.weight(.semibold))
                Spacer()
                Text(testType)
                    .font(.footnote)
                    .foregroundColor(.accentColor)
                    .frame(width: 74, height: 29)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
            }
            HStack{
                Image(systemName: "clock.fill")
                Text("Get reports by:").font(.caption)
                Text(tDuration).foregroundColor(.accentColor).font(.caption)
            }
        }
        Divider()
        
        VStack(alignment: .leading){
            Text(tPrice).font(.callout.weight(.semibold)).foregroundColor(.accentColor)
            
            HStack{
                Text("inclusive of all taxes").font(.caption).foregroundColor(.secondary)
                
                Button(action: {}, label: {
                    Text("see details ->").font(.caption.weight(.semibold)).foregroundColor(.black)
                }).hTrailing()
            }
        }
    }
    .padding(8)
    .frame(width: 370, height: 170)
    .background(Color.gray.opacity(0.1))
    .cornerRadius(15)
    .padding()
}

struct PLabTestExpansionCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            PLabTestExpansionCard(tName: " (CBC)", testType: "Package", tDuration: "1 day", tPrice: "1299")
            PLabTestExpansionCard(tName: "Complete Blood Count (CBC)", testType: "Test", tDuration: "1 day", tPrice: "1299")
        }
    }
}
