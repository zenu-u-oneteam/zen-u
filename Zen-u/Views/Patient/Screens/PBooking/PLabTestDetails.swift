//
//  PLabTestDetails.swift
//  Zen-u
//
//  Created by Archit Khanna on 02/05/23.
//

import SwiftUI

struct PLabTestDetails: View {
    
    @State private var showModal = false
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    LazyVStack(alignment: .center, spacing: 20){
                        
                        PLabTestDetailsCard(tName: "Complete Blood Count (CBC)", testType: "Package", tDuration: "1 day", tSample: "Blood, Urine", gender: "Not specified", ageGroup: "all age groups")
                        
                        HStack{
                            Text("Tests Included").font(.title3.weight(.semibold))
                            
                            Spacer()
                            
                            Button(action: { showModal = true}, label: {
                                ViewButton(text: "View all", selected: false, selectable: true)})
                        }.padding(.horizontal, 15)
                        HStack{
                            Image(systemName: "syringe.fill").font(.callout)
                            Text(tests[0]).font(.callout)
                            Text("+ \(tests.count) more").font(.callout).foregroundColor(.accentColor)
                            
                        }.hLeading()
                            .padding(8)
                            .frame(height: 49)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(15)
                            .padding()

                            
                        
                        VStack(alignment: .leading, spacing: 20){
                            Text("About").font(.title3.weight(.semibold)).padding(.horizontal, 15)
                            
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ").font(.caption).padding(.horizontal, 15)
                        }
                    }
                }
                Spacer()
                
                VStack{
                    HStack{
                        VStack{
                            Text("INR 1299").font(.title3).foregroundColor(.accentColor)
                            Text("inclusive of all taxes").font(.caption).foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            Text("Continue").font(.callout).foregroundColor(.white)
                        })
                        .frame(width: 180, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                    }
                }.padding()
                    .frame(height: 74)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
            }
            .navigationTitle(selectedTestName ?? "").font(.largeTitle)
            PLabTestDetailsModalView(isShowing: $showModal)
        }
    }
}
struct PLabTestDetails_Previews: PreviewProvider {
    static var previews: some View {
        PLabTestDetails()
    }
}
