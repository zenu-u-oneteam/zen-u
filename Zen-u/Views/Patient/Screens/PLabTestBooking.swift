//
//  PLabTestBooking.swift
//  Zen-u
//
//  Created by Archit Khanna on 25/04/23.
//

import SwiftUI
var test = ["Blood", "Pregnancy", "X-Ray", "Ultrasound"]
var testImages = ["bloodTest", "pregnancy_image", "X-Ray", "UltraSound"]
var VitalOrganTest = ["Heart", "Kidney", "Liver"]
var VitalOrganTestImage = ["heart_image", "kidney_image", "liver_image"]
struct PLabTestBooking: View {
    
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationView(){
            ZStack(alignment: .top){
                ScrollView{
                    Spacer(minLength: 20)
                    
                    VStack(spacing: 40){
                        
                        VStack(spacing: 20) {
                            HStack(spacing: 150){
                                
                                Text("Recommended").font(.title3.weight(.semibold))
                                
                                Button(action: {}, label: {
                                    ViewButton(text: "View All", selectable: true)
                                })
                                
                                
                            }
                            PLabTestcard(Testname: test, Testimage: testImages, showNumber: 2 )
                        }
                        
                        
                        
                        
                        VStack(spacing: 20) {
                            HStack(spacing: 175){
                                
                                Text("Vital Organs").font(.title3.weight(.semibold))
                                
                                Button(action: {}, label: {
                                    ViewButton(text: "View All", selectable: true)
                                })
                                
                                
                            }
                            PVitalOrganTestcard(VitalOrganTestname: VitalOrganTest, VitalOrganTestimage: VitalOrganTestImage)
                        }
                        
                        VStack(spacing: 30){
                            
                            HStack(spacing: 60){
                                
                                Text("Popular Health Packages").font(.title3.weight(.semibold))
                                
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
                                        }).hTrailing()
                                    }
                                }
                                
                            }   .padding()
                                .frame(width: 390, height: 162)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                            
                            
                        }
                        
                    }.navigationTitle("Booking Lab Tests").font(.largeTitle.weight(.bold))
                        .searchable(text: $searchText)
                }
            }
        }
    }
    
    
    struct PLabTestBooking_Previews: PreviewProvider {
        static var previews: some View {
            PLabTestBooking()
        }
    }
}
