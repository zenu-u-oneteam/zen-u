//
//  AilmentDetails.swift
//  Zen-u
//
//  Created by Inzamam on 03/05/23.
//

import SwiftUI

struct AilmentView: View {
    @State var searchText = ""
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                        PVaccineCard(vaccineName: "Chickenpox", numberOfAvailableDoses: "123", Status: "Available", height: 100)
                        
                        PVaccineCard(vaccineName: "Influenza", numberOfAvailableDoses: "131", Status: "Available", height: 100)
                        
                        
                        PVaccineCard(vaccineName: "Covid-19", numberOfAvailableDoses: "99", Status: "Available",  height: 100)
                        
                        PVaccineCard(vaccineName: "Chickenpox", numberOfAvailableDoses: "37", Status: "Available",  height: 100)
                }
                
            }
            .searchable(text: $searchText)
            .navigationTitle("Search by Ailment")
            .padding(.horizontal,16)
        }
    }
}

struct AilmentDetails_Previews: PreviewProvider {
    static var previews: some View {
        AilmentView()
    }
}
