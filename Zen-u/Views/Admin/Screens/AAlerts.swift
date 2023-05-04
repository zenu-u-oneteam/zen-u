//
//  AAlerts.swift
//  Zen-u
//
//  Created by Tanvi Gupta on 04/05/23.
//

import SwiftUI

struct AAlerts: View {
      @State var isResolvedIndex = 0
       let options = ["Not Resolved", "Resolved"]
       @StateObject private var viewModel = ViewModel()
    var body: some View {
        NavigationView() {
            VStack{

//                Picker(selection: $isResolvedIndex, label: Text("")) {
//                    ForEach(0 ..< options.count) { index in
//                        Text(self.options[index]).tag(index)
//                        
//                    }
//                }
//                .pickerStyle(SegmentedPickerStyle())
//                .padding()
                SegmentedPicker($isResolvedIndex, selections: options)
                Spacer(minLength: 20)
                ScrollView{
                    LazyVStack(spacing : 30 ){
                        if isResolvedIndex == 0 {
                            
                            ForEach(viewModel.unResolvedalertList.indices, id: \.self) { index in
                                AlertCard(code: viewModel.unResolvedalertList[index].code, date: "05-05-2023", time: "13:00", desc: viewModel.unResolvedalertList[index].description)
                                
                                
                            }
                            
                        } else {
                            
                            
                            ForEach(viewModel.resolvedalertList.indices, id: \.self) { index in
                                AlertCard(code: viewModel.resolvedalertList[index].code, date: "05-05-2023", time: "13:00", desc: viewModel.resolvedalertList[index].description)
                                
                                
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
struct AlertCard: View {
    @State var code : String
    @State var date : String
    @State var time : String
    @State var desc : String
    var body: some View {
        VStack(alignment: .leading) {
            Text("Code \(code)")
                .font(.title .weight(.bold))
                .foregroundColor(.white)
            HStack{
                Text("Date: \(date)")
                    .font(.caption)
                Spacer()
                Image(systemName: "clock")
                Text("\(time)").font(.caption)
            }
            Spacer()
            
            Text("\(desc)")
                .font(.headline .weight(.semibold))
                .foregroundColor(.black)

        }
        .padding(24)
        .background(Color("CodeOrange"))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}
struct AAlerts_Previews: PreviewProvider {
    static var previews: some View {
        AAlerts()
    }
}
