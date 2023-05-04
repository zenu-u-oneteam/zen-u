//
//  PLabTestExpansion.swift
//  Zen-u
//
//  Created by Archit Khanna on 02/05/23.
//

import SwiftUI

struct PLabTestExpansion: View {
    @State var searchableText = ""
    
    
    var body: some View {
            ScrollView{
                LazyVStack(alignment: .leading){
                    HStack(spacing:15){
                        Button(action: {}, label: {
                            ViewButton(text: "All", selected: false, selectable: true)
                        })
                        Button(action: {}, label: {
                            ViewButton(text: "Test", selected: false, selectable: true)
                        })
                        Button(action: {}, label: {
                            ViewButton(text: "Packages", selected: false, selectable: true)
                        })
                    }.padding(.horizontal, 15)
                    PLabTestExpansionCard(tName: "Complete Blood Count (CBC)", testType: "Package", tDuration: "1 day", tPrice: "1299")
                    PLabTestExpansionCard(tName: "Cholestrol-Serum", testType: "Test", tDuration: "On same day", tPrice: "1299")
                    PLabTestExpansionCard(tName: "Harsh-Sparsh", testType: "Test", tDuration: "Never", tPrice: "9999")
                }.navigationTitle("Blood Test")
                    .searchable(text: $searchableText)
                    .padding(20)
            }
        
    }
}

struct PLabTestExpansion_Previews: PreviewProvider {
    static var previews: some View {
        PLabTestExpansion()
    }
}
