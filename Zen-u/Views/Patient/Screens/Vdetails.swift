//
//  Vdetails.swift
//  Zen-u
//
//  Created by Inzamam on 04/05/23.
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
        .font(.largeTitle.weight(.semibold))
    
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
    Button{
        
    }
label: {
    
    NavigationLink(destination:  PSlotSelection(reason: "", department: DepartmentRaw(doctors: ["L4KhoPHiaUUDSn2ep51mZtyqx2O2"]), appointmentType: AppointmentTypeRaw(name: "", amount: 0.0, category: "", department: ""))){
        HStack {
            Text("INR 1299")
                .font(.title3.weight(.semibold))
                .foregroundColor(Color("Accent"))
            Spacer()
            
            TabButton(text: "Continue", fullWidth: false)
        }
        .padding()
        .padding(.leading, 20)
        .foregroundColor(Color("Heading"))
        .background(Color("Secondary"))
    }
}
    
}


struct Vdetails_Previews: PreviewProvider {
    static var previews: some View {
        Vdetails()
    }
}

