//
//  PLabTestRecommended.swift
//  Zen-u
//
//  Created by Archit Khanna on 26/04/23.
//

import SwiftUI

struct PLabTestRecommended: View {
    @State var selectedRecommendedCardIndex: Int? = nil
    var testNames = ["Kidney", "Liver", "Heart", "Blood", "Thyroid", "Bone", "Lungs", "Joint"]
    var testImages = ["kidney_image", "liver_image", "heart_image", "blood_test", "lung_image", "bone_image", "lung_image", "joint-image"]
    
    @State var searchableText = ""
    
    var body: some View {
            ScrollView {
                PLabTestcard(Testname: testNames, Testimage: testImages, viewAll: true, selectedCardIndex: $selectedRecommendedCardIndex).padding(.top, 30)
                
                Spacer(minLength: 120)
                
                Button(action: {}, label: {
                    NavigationLink(destination: PLabTestDetails()){
                        if selectedRecommendedCardIndex != nil{
                            TabButton(text: "Continue")}
                    }
                })
            }
            .navigationTitle("Recommended Tests")
            .searchable(text: $searchableText)
        
    }
}

struct PLabTestRecommended_Previews: PreviewProvider {
    static var previews: some View {
        PLabTestRecommended()
    }
}
