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
    var height: CGFloat = 75
    var width: CGFloat = 100
    @State private var isModalPresented = false
    
    var body: some View {
        
        if(expanded){
            expandedForm()
                .sheet(isPresented: $isModalPresented) {
                    ModalView()
                }
        }
        else{
            collapsedForm()
                .sheet(isPresented: $isModalPresented) {
                    ModalView()
                }
        }
    }
    
    
    func collapsedForm() -> some View
    {
        Button{
            isModalPresented = true
        }
    label: {
        //  NavigationLink(destination: Vdetails()){
        VStack(alignment: .center){
            
            VStack(alignment: .center) {
                Text(vaccineName)
                    .font(.headline.weight(.semibold))
                
                Text(companyName ?? "")
                    .font(.subheadline.weight(.regular))
                
            }
            Spacer()
            VStack(alignment: .center) {
                Text(numberOfAvailableDoses)
                    .font(.title.weight(.bold))
                
                Text(Status)
                    .font(.subheadline.weight(.bold))
            }
        }
        .frame(width: width, height: height)
        .padding()
        .foregroundColor(Color("Heading"))
        .background(Color("Secondary"))
        .cornerRadius(10)
    }
    }
    
    
    func expandedForm() -> some View
    {
        Button{
            isModalPresented = true
        }
    label: {
        //     NavigationLink(destination: Vdetails()){
        HStack{
            
            VStack(alignment: .leading) {
                Text(vaccineName)
                    .font(.title2.weight(.semibold))
                
                Text(companyName ?? "")
                    .font(.subheadline.weight(.regular))
                
            }
            Spacer()
            VStack(alignment: .center) {
                Text(numberOfAvailableDoses)
                    .font(.title.weight(.bold))
                
                Text(Status)
                    .font(.subheadline)
            }
        }
        .frame(height: height)
        .padding()
        .foregroundColor(Color("Heading"))
        .background(Color("Secondary"))
        .cornerRadius(10)
    }
    }
}

struct ModalView: View {
    var body: some View {
        Vdetails()
    }
}

struct PVaccineCard_Previews: PreviewProvider {
    static var previews: some View {
        PVaccineCard(vaccineName: "PSV23",companyName: "Pfizer", numberOfAvailableDoses: "123", Status: "Available", expanded: false)
    }
}

