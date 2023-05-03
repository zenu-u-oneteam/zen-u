//
//  PLabTestBooking.swift
//  Zen-u
//
//  Created by Archit Khanna on 25/04/23.
//

import SwiftUI

struct PLabTestBooking: View {
    var test = ["Blood", "Pregnancy", "X-Ray", "Ultrasound"]
    var testImages = ["blood_test", "pregnancy_image", "x_ray", "UltraSound"]
    var VitalOrganTest = ["Heart", "Kidney", "Liver"]
    var VitalOrganTestImage = ["heart_image", "kidney_image", "liver_image"]
    @State private var selectedRecommendedCardIndex: Int?
    @State private var selectedVitalOrganCardIndex: Int?
    @State private var searchText = ""
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing: 40){
                    VStack(spacing: 20) {
                        HStack(){
                            Text("Recommended").font(.title3.weight(.semibold))
                            Spacer()
                            Button(action: {}, label: {
                                ViewButton(text: "View All", selectable: true)
                            })
                        }
                        PLabTestcard(Testname: test, Testimage: testImages, viewAll: false, selectedCardIndex: $selectedRecommendedCardIndex)
                        
                        VStack(spacing: 20) {
                            HStack(){
                                
                                Text("Vital Organs").font(.title3.weight(.semibold))
                                Spacer()
                                Button(action: {}, label: {
                                    ViewButton(text: "View All", selectable: true)
                                })
                            }
                            PVitalOrganTestcard(VitalOrganTestname: VitalOrganTest, VitalOrganTestimage: VitalOrganTestImage, viewAll: false, selectedCardIndex: $selectedVitalOrganCardIndex)
                        }
                        
                        VStack(spacing: 30){
                            
                            HStack(){
                                
                                Text("Popular Health Packages").font(.title3.weight(.semibold))
                                Spacer()
                                Button(action: {}, label: {
                                    ViewButton(text: "View All", selectable: true)
                                })
                            }
                            VStack(alignment:.leading, spacing: 20){
                                
                                VStack(alignment:.leading, spacing: 0){
                                    
                                    HStack(spacing: 70) {
                                        Text("Complete Blood Count (CBC)").font(.callout)
                                            .foregroundColor(.black)
                                        
                                        Button(action: {}, label: {
                                            Text("Package").font(.footnote)
                                        }).frame(width: 74, height: 29)
                                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.gray.opacity(0.3)))
                                    }
                                    HStack(){
                                        Image(systemName: "clock.fill").font(.system(size: 15))
                                        
                                        Text("Get Reports by:").font(.caption).foregroundColor(.secondary)
                                        
                                        Text("1 day").font(.caption).foregroundColor(.accentColor)
                                    }
                                }
                                
                                Divider()
                                
                                VStack(alignment:.leading){
                                    Text("INR 1299").font(.callout.weight(.bold)).foregroundColor(.accentColor)
                                    HStack(spacing: 10){
                                        Text("inclusive of all taxes").font(.caption).foregroundColor(.secondary)
                                        Button(action: {}, label: {
                                            Text("see details > ").font(.caption).foregroundColor(.black)
                                        })
                                    }
                                }
                            }
                            .frame(height: 162)
                            .padding(.horizontal, 15)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                        }
                        Button(action: {}, label: {
                            NavigationLink(destination: PLabTestDetails()) {
                                TabButton(text: "Continue")
                            }
                        })
                    }
                }
                .padding(.horizontal, 15)
                .navigationTitle("Booking Lab Tests").font(.largeTitle.weight(.bold))
                .searchable(text: $searchText)
            }
        }
    }
    struct PLabTestBooking_Previews: PreviewProvider {
        static var previews: some View {
            PLabTestBooking()
        }
    }
}

