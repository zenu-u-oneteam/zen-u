//
//  VBooking.swift
//  Zen-u
//
//  Created by Inzamam on 26/04/23.
//

import SwiftUI

struct VBooking: View {
    @State var searchText = ""
    var body: some View {
        
        NavigationStack{
            VStack(alignment: .leading, spacing: 20) {
                Button{
                    
                }
            label: {
                NavigationLink(destination: Covid_19Center()){
                    HStack{
                        Image(systemName: "info.circle")
                            .font(.title2)
                            .foregroundColor(.red)
                            .frame(width: 20)
                            .padding(.trailing, 5)
                        
                        VStack(alignment: .leading) {
                            Text("Covid-19")
                                .font(.headline.weight(.semibold))
                            
                            Text("Search your nearest Vaccination Center")
                                .font(.subheadline.weight(.regular))
                            
                        }.frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    .foregroundColor(Color("Heading"))
                    .background(Color("Secondary"))
                    .cornerRadius(10)
                }
            }
                
                
                HStack {
                    Text("Vaccinations")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3.weight(.semibold))
                    Button{
                        
                    }label: {
                        NavigationLink(destination: VaccineView()){
                            ViewButton(text: "View All", selectable: true)
                        }
                    }
                    
                }
                
                
                PVaccineCard(vaccineName: "PSV23", companyName: "Pfizer", numberOfAvailableDoses: "131", Status: "Available", expanded: true)
                
                PVaccineCard(vaccineName: "Remdesivir", companyName: "Veklury", numberOfAvailableDoses: "103", Status: "Available", expanded: true)
                
                
                HStack {
                    Text("Search by Ailment")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3.weight(.semibold))
                    Button{
                        
                    }label: {
                        NavigationLink(destination: AilmentView()){
                            ViewButton(text: "View All", selectable: true)
                        }
                    }
                    
                }
                
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: 20) {
                        
                        PVaccineCard(vaccineName: "Chickenpox", numberOfAvailableDoses: "123", Status: "Available", expanded: false, height: 100)
                        
                        PVaccineCard(vaccineName: "Influenza", numberOfAvailableDoses: "131", Status: "Available", expanded: false, height: 100)
                        
                        
                        PVaccineCard(vaccineName: "Covid-19", numberOfAvailableDoses: "99", Status: "Available", expanded: false, height: 100)
                        
                        PVaccineCard(vaccineName: "Chickenpox", numberOfAvailableDoses: "37", Status: "Available", expanded: false, height: 100)
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.horizontal, -16)
                Spacer()
            }.padding(.horizontal,16)
                .navigationTitle("Vaccination Booking")
                .searchable(text: $searchText)
            
        }
    }
}

struct VBooking_Previews: PreviewProvider {
    static var previews: some View {
        VBooking()
    }
}

