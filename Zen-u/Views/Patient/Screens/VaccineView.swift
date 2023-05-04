//
//  VaccineView.swift
//  Zen-u
//
//  Created by Inzamam on 04/05/23.
//

import SwiftUI

struct VaccineView: View {
    @State var searchText = ""
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView(showsIndicators: false){
                    VStack(spacing:20){
                        PVaccineCard(vaccineName: "PSV23",companyName: "Pfizer", numberOfAvailableDoses: "123", Status: "Available", expanded: true)
                        
                        PVaccineCard(vaccineName: "PSV23",companyName: "Pfizer", numberOfAvailableDoses: "123", Status: "Available", expanded: true)
                        
                        PVaccineCard(vaccineName: "PSV23",companyName: "Pfizer", numberOfAvailableDoses: "123", Status: "Available", expanded: true)
                        
                        PVaccineCard(vaccineName: "PSV23",companyName: "Pfizer", numberOfAvailableDoses: "123", Status: "Available", expanded: true)
                        
                        PVaccineCard(vaccineName: "PSV23",companyName: "Pfizer", numberOfAvailableDoses: "123", Status: "Available", expanded: true)
                        
                        PVaccineCard(vaccineName: "PSV23",companyName: "Pfizer", numberOfAvailableDoses: "123", Status: "Available", expanded: true)
                        
                        PVaccineCard(vaccineName: "PSV23",companyName: "Pfizer", numberOfAvailableDoses: "123", Status: "Available", expanded: true)
                        
                    }
                }
            } .searchable(text: $searchText)
            .navigationTitle("Vaccine")
            .padding(.horizontal, 17)
        }
       
    }
}

struct VaccineDetails_Previews: PreviewProvider {
    static var previews: some View {
        VaccineView()
    }
}
