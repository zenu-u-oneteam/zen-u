//
//  Vdetails.swift
//  Zen-u
//
//  Created by Inzamam on 04/05/23.
//

import SwiftUI

struct PVaccinationDetails: View {
    let sideEffects: [String] = [
        "Reaction to the drug if allergic.",
        "Redness or numbness in the area",
        "Tiredness",
        "Feverish and muscle aches"
    ]
    
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 20) {
                HeaderView()
                Spacer()
                AboutVaccineView()
                Text("Side Effects")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3.weight(.semibold))
                ListOfSideEffectsView(sideEffects)
                Spacer()
            }
            .padding(24)
            SummaryView()
        }
    }
}


func HeaderView() -> some View{
    Text("Vaccinations Details")
        .font(.largeTitle.weight(.semibold))
}

func AboutVaccineView() -> some View{
    
    VStack {
        Text("About Vaccine")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.title3.weight(.semibold))
        
        HStack {
            VStack(alignment: .leading) {
                Text("PSV23 (Pneumo)")
                    .font(.headline.weight(.semibold))
                    .padding(.bottom, 1)
                
                Text("Merck Sharp & Dohme Corp Inc.")
                    .font(.subheadline.weight(.regular))
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 5)
            Spacer()
        }
        .padding()
        .background(Color("Secondary"))
        .cornerRadius(10)
    }
}


func ListOfSideEffectsView(_ sideEffects: [String]) -> some View {
    ScrollView {
        VStack {
            ForEach(sideEffects, id: \.self) { sideEffect in
                HStack {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 5))
                        .foregroundColor(.secondary)
                    
                    Text(sideEffect)
                        .font(.subheadline.weight(.regular))
                        .foregroundColor(.secondary)
                    
                    Spacer()
                }
                .padding(.bottom, 0.1)
            }
        }
        .padding()
        .padding(.vertical, 5)
        .background(Color("Secondary"))
        .cornerRadius(10)
    }
}

func SummaryView() -> some View {
    HStack {
        Text("INR 1299")
            .font(.title3.weight(.semibold))
            .foregroundColor(Color("Accent"))
        Spacer()
        
        Button {
            
        } label: {
            NavigationLink(destination:  PSlotSelection(reason: "", department: DepartmentRaw(doctors: ["L4KhoPHiaUUDSn2ep51mZtyqx2O2"]), appointmentType: AppointmentTypeRaw(name: "", amount: 0.0, category: "", department: ""))) {
                TabButton(text: "Continue", fullWidth: false)
            }
        }
    }
    .padding()
    .padding(.leading, 20)
    .foregroundColor(Color("Heading"))
    .background(Color("Secondary"))
}


struct PVaccinationDetails_Previews: PreviewProvider {
    static var previews: some View {
        PVaccinationDetails()
    }
}
