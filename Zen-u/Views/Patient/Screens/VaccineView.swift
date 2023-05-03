//
//  VaccineDetails.swift
//  Zen-u
//
//  Created by Inzamam on 03/05/23.
//

import SwiftUI

struct VaccineView: View {
    @State var searchText = ""
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    HStack(spacing:20){
                        PVaccineCard(vaccineName: "PSV23", numberOfAvailableDoses: "123", Status: "Available", expanded: false, height: 80)
                        
                        PVaccineCard(vaccineName: "PSV23", numberOfAvailableDoses: "123", Status: "Available", expanded: false, height: 80)
                        
                        PVaccineCard(vaccineName: "PSV23", numberOfAvailableDoses: "123", Status: "Available", expanded: false, height: 80)
                    }
                }
            }
            .navigationTitle("Vaccine")
            .padding(16)
        }
        
        .searchable(text: $searchText)
    }
}

struct VaccineDetails_Previews: PreviewProvider {
    static var previews: some View {
        VaccineView()
    }
}
