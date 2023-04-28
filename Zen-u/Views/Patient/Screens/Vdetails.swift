//
//  Vdetails.swift
//  Zen-u
//
//  Created by Inzamam on 27/04/23.
//

import SwiftUI

struct Vdetails: View {
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 20) {
                headerView()
                Spacer()
                aboutVaccineView()
                Text("Side Effects")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3.weight(.semibold))
                listOfSideEffectsView()
                Spacer()
            }
            .padding(24)
            summaryView()
        }
    }
}


func headerView() -> some View{
    Text("Vaccinations\nDetails")
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.largeTitle.weight(.heavy))
    
}

func aboutVaccineView() -> some View{
    
    VStack {
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
            
        }
        .padding()
        .background(Color("Secondary"))
        .cornerRadius(10)
    }
}


func listOfSideEffectsView() -> some View{
    ScrollView {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                
                Image(systemName: "circle.fill")
                    .font(.system(size: 5))
                    .foregroundColor(.secondary)
                Image(systemName: "circle.fill")
                    .font(.system(size: 5))
                    .foregroundColor(.secondary)
                Image(systemName: "circle.fill")
                    .font(.system(size: 5))
                    .foregroundColor(.secondary)
                Image(systemName: "circle.fill")
                    .font(.system(size: 5))
                    .foregroundColor(.secondary)
                
                
            }
            VStack(alignment:.leading) {
                Text("Reaction to the drug if allergic.")
                    .font(.subheadline.weight(.regular))
                    .foregroundColor(.secondary)
                
                Text("Redness or numbness in the area")
                    .font(.subheadline.weight(.regular))
                    .foregroundColor(.secondary)
                Text("Tiredness")
                    .font(.subheadline.weight(.regular))
                    .foregroundColor(.secondary)
                Text("Feverish and muscle aches")
                    .font(.subheadline.weight(.regular))
                    .foregroundColor(.secondary)
                
    
                
            }
            Spacer()
        }
        .padding()
        .background(Color("Secondary"))
        .cornerRadius(10)
    }
}

func summaryView() -> some View{
    HStack {
        Text("INR 1299")
            .font(.title.weight(.semibold))
        Spacer()
        
        TabButton(text: "Continue", fullWidth: false)
    }
    .padding()
    .padding(.leading, 20)
    .frame(width: .infinity)
    .background(Color("Secondary"))
    
}


struct Vdetails_Previews: PreviewProvider {
    static var previews: some View {
        Vdetails()
    }
}
