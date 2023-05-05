//
//  AilmentView.swift
//  Zen-u
//
//  Created by Inzamam on 04/05/23.
//


import SwiftUI

struct AilmentView: View {
    @State var searchText = ""
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 10) {
                PVaccineCard(vaccineName: "Chickenpox", numberOfAvailableDoses: "123", Status: "Available\nVaccines")
                
                PVaccineCard(vaccineName: "Influenza", numberOfAvailableDoses: "131", Status: "Available\nVaccines")
                
                PVaccineCard(vaccineName: "Covid-19", numberOfAvailableDoses: "99", Status: "Available\nVaccines")
                
                PVaccineCard(vaccineName: "Chickenpox", numberOfAvailableDoses: "37", Status: "Available\nVaccines")
                
                PVaccineCard(vaccineName: "Measles", numberOfAvailableDoses: "37", Status: "Available\nVaccines")
                
                PVaccineCard(vaccineName: "Polio", numberOfAvailableDoses: "37", Status: "Available\nVaccines")
                
                PVaccineCard(vaccineName: "Chickenpox", numberOfAvailableDoses: "123", Status: "Available\nVaccines")
                
                PVaccineCard(vaccineName: "Influenza", numberOfAvailableDoses: "131", Status: "Available\nVaccines")
                
                PVaccineCard(vaccineName: "Covid-19", numberOfAvailableDoses: "131", Status: "Available\nVaccines")
            }
            .searchable(text: $searchText)
            .navigationTitle("Search by Ailment")
            .padding(.horizontal, 17)
            .padding(.vertical, 10)
        }
    }
}

struct AilmentDetails_Previews: PreviewProvider {
    static var previews: some View {
        AilmentView()
    }
}
