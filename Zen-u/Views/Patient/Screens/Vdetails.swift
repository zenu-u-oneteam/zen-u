//
//  Vdetails.swift
//  Zen-u
//
//  Created by Inzamam on 27/04/23.
//

import SwiftUI

struct Vdetails: View {
    let items = ["Item 1", "Item 2", "Item 3"]
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Vaccinations\nDetails")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.largeTitle.weight(.heavy))
          
                Text("About Vaccine")
                    .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title3.weight(.semibold))
                
                
            HStack {
                VStack(alignment: .leading) {
                    Text("PSV23 (Pneumo)")
                        .font(.headline.weight(.semibold))
                    
                    Text("Merck Sharp & Dohme Corp Inc.")
                        .font(.subheadline.weight(.regular))
                        .foregroundColor(.secondary)
                }
                Spacer()
                    
            }.padding()
                .background(Color("Secondary"))
            .cornerRadius(10)
            
            Text("Side Effects")
                .frame(maxWidth: .infinity, alignment: .leading)
            .font(.title3.weight(.semibold))
            
            
        HStack {
            VStack(alignment: .leading) {
                Text("PSV23 (Pneumo)")
                    .font(.headline.weight(.semibold))
                
                Text("Merck Sharp & Dohme Corp Inc.")
                    .font(.subheadline.weight(.regular))
                    .foregroundColor(.secondary)
            }
            Spacer()
                
        }.padding()
            .background(Color("Secondary"))
        .cornerRadius(10)
            
            List(items, id: \.self) { item in
                HStack {
                    Image(systemName: "circle.fill")
//                        .font(.size(10))
                        .foregroundColor(.blue)
                    Text(item)
                }
            }
            
               
            
            Spacer()
            
        }.padding(24)
        
        
    }
}

struct Vdetails_Previews: PreviewProvider {
    static var previews: some View {
        Vdetails()
    }
}
