//
//  AAlerts.swift
//  Zen-u
//
//  Created by Tanvi Gupta on 04/05/23.
//

import SwiftUI

struct AAlerts: View {
    @State private var selectedIndex = 0
       let options = ["Not Resolved", "Resolved"]
    
    var body: some View {
        NavigationView() {
            VStack{

                Picker(selection: $selectedIndex, label: Text("")) {
                    ForEach(0 ..< options.count) { index in
                        Text(self.options[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                Spacer()
                if selectedIndex == 1 {
                    Text("Resolved items go here")
                        .padding()
                } else {
                    ScrollView{
                        LazyVStack(spacing: 20) {
                            ForEach(1...3, id: \.self) { index in
                                VStack(alignment: .leading) {
                                    Text("Code Orange")
                                        .font(.title .weight(.bold))
                                        .foregroundColor(.white)
                                    HStack{
                                        Text("Date: 03-05-2023")
                                            .font(.caption)
                                        Spacer()
                                        Image(systemName: "clock")
                                        Text("13:45").font(.caption)
                                    }
                                    Spacer()
                                    
                                    Text("Its a call for amedical decontamination, usually due to a hazardous fluids spill")
                                        .font(.headline .weight(.semibold))
                                        .foregroundColor(.black)

                                }
                                .padding(24)
                                .background(Color("CodeOrange"))
                                .cornerRadius(15)
                                
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                                    
                                
                            }
                        }

                        
                    }
                }
                
                
            }
            .padding(24)
            .navigationTitle("Raised Alerts")
        }
    }
}

struct AAlerts_Previews: PreviewProvider {
    static var previews: some View {
        AAlerts()
    }
}
