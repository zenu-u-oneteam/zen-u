//
//  PLabTestVitalOrgans.swift
//  Zen-u
//
//  Created by Archit Khanna on 03/05/23.
//

import SwiftUI

struct PLabTestVitalOrgans: View {
    @State var selectedVitalOrganCardIndex: Int? = nil
    var testNames = ["Kidney", "Liver", "Heart", "Blood", "Thyroid", "Bone", "Lungs", "Joint"]
    var testImages = ["kidney_image", "liver_image", "heart_image", "blood_test", "lung_image", "bone_image", "lung_image", "joint-image"]
    
    @State var searchableText = ""
    
    var body: some View {
            ScrollView {
                PVitalOrganTestcard(VitalOrganTestname: testNames, VitalOrganTestimage: testImages, viewAll: true, selectedCardIndex: $selectedVitalOrganCardIndex).padding(.top, 30)
                
                Spacer(minLength: 120)
                
                Button(action: {}, label: {
                    NavigationLink(destination: PLabTestDetails()){
                        
                        if selectedVitalOrganCardIndex != nil{
                        TabButton(text: "Continue")}
                }
                })
            }
            .navigationTitle("Vital Organs")
            .searchable(text: $searchableText)
        }
    }


struct PLabTestVitalOrgans_Previews: PreviewProvider {
    static var previews: some View {
        PLabTestVitalOrgans()
    }
}
