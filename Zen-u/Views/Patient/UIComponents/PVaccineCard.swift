//
//  PVaccineCard.swift
//  Zen-u
//
//  Created by Inzamam on 04/05/23.
//

import SwiftUI

struct PVaccineCard: View {
    var vaccineName: String
    var companyName: String?
    var numberOfAvailableDoses: String
    var Status : String
    var expanded: Bool = true
    var width: CGFloat = 100
    @State private var isModalPresented = false
    
    var body: some View {
        
        if(expanded){
            expandedForm()
                .sheet(isPresented: $isModalPresented) {
                    ModalView()
                }
        } else{
            collapsedForm()
                .sheet(isPresented: $isModalPresented) {
                    ModalView()
                }
        }
    }
    
    
    func collapsedForm() -> some View {
        Button{
            isModalPresented = true
        } label: {
            VStack(alignment: .center){
                VStack(alignment: .center) {
                    Text(vaccineName)
                        .font(.headline.weight(.semibold))
                    
                    Text(companyName ?? "")
                        .font(.subheadline.weight(.regular))
                    
                }
                .padding(.bottom, 5)
                VStack(alignment: .center) {
                    Text(numberOfAvailableDoses)
                        .font(.title.weight(.bold))

                    Text(Status)
                        .font(.subheadline.weight(.bold))
                }
            }
            .frame(width: width)
            .padding()
            .padding(.vertical, 5)
            .foregroundColor(Color("Heading"))
            .background(Color("Secondary"))
            .cornerRadius(10)
        }
    }
    
    
    func expandedForm() -> some View {
        Button{
            isModalPresented = true
        } label: {
            HStack{
                VStack(alignment: .leading) {
                    Text(vaccineName)
                        .font(.title2.weight(.semibold))
                    if (companyName != nil) {
                        Text(companyName!)
                            .font(.subheadline.weight(.regular))
                    }
                }
                Spacer()
                VStack(alignment: .center) {
                    Text(numberOfAvailableDoses)
                        .font(.title.weight(.bold))
                    
                    Text(Status)
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(Color("Heading"))
            .background(Color("Secondary"))
            .cornerRadius(10)
        }
    }
}

struct ModalView: View {
    var body: some View {
        PVaccinationDetails()
    }
}

struct PVaccineCard_Previews: PreviewProvider {
    static var previews: some View {
        PVaccineCard(vaccineName: "PSV23", companyName: "Pfizer", numberOfAvailableDoses: "123", Status: "Available", expanded: true)
    }
}

