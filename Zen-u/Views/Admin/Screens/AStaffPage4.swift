//
//  AdminStaffPage4.swift
//  Zen-u
//
//  Created by Debarghya Barik on 27/04/23.
//

import SwiftUI

struct AdminStaffPage4: View {
    @State private var searchText = ""
    @State var typeIndex1: Int = 0
    var typeSelections1: [String] = ["All", "OB/GYN", "Dentistry", "Orthopedics"]
    @State private var addbutton: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                
                VStack(alignment: .leading){
                    
                    Menu {
                        ForEach(typeSelections1.indices, id: \.self) {type in
                            Button(typeSelections1[type], action: {typeIndex1 = type})
                        }
                    } label: {
                        ViewButton(text: typeSelections1[typeIndex1], rIcon: "chevron.down")
                    }
                    .padding(.bottom , 8)
                    
                    
                    ScrollView {
                        LazyVStack {
                            ForEach(0..<6) { numberOfCapsule in
                                VStack(alignment: .center) {
                                    HStack {
                                        Image(systemName: "person.circle.fill")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                        
                                        Text("Medical Department")
                                            .frame(width: 163)
                                            .font(.headline.weight(.semibold))
                                        
                                        Image(systemName: "chevron.forward")
                                            .foregroundColor(Color("Tag"))
                                            .padding(.leading, 100)
                                    }
                                    Divider()
                                }
                                .frame(width: 314)
                            }
                        }
                        .padding(8)
                    }
                    .background(Color("Secondary"))
                    .cornerRadius(10)
                    .frame(maxHeight: .infinity)
                    
                    Spacer()
                }
                
                .searchable(text: $searchText)
                
                .navigationTitle("Medical Department")
                
                VStack {
                    if addbutton == true {
                        Button(action: {addbutton = true}) {
                            Image.init(systemName: "plus")
                                .font(.title2)
                                .frame(width: 50, height: 50)
                                .background(Color("Accent"))
                                .foregroundColor(Color.white)
                                .cornerRadius(25)
                        }
                        Button(action: {addbutton = true}) {
                            Image.init(systemName: "plus")
                                .font(.title2)
                                .frame(width: 50, height: 50)
                                .background(Color("Accent"))
                                .foregroundColor(Color.white)
                                .cornerRadius(25)
                        }
                        Button(action: {addbutton = true}) {
                            Image.init(systemName: "plus")
                                .font(.title2)
                                .frame(width: 50, height: 50)
                                .background(Color("Accent"))
                                .foregroundColor(Color.white)
                                .cornerRadius(25)
                        }
                        Button(action: {addbutton = false}) {
                            Image.init(systemName: "multiply")
                                .font(.title2)
                                .frame(width: 50, height: 50)
                                .background(Color("Secondary"))
                                .foregroundColor(Color("Heading"))
                                .cornerRadius(25)
                        }
                    } else {
                        Button(action: {addbutton = true}) {
                            Image.init(systemName: "plus")
                                .font(.title2)
                                .frame(width: 50, height: 50)
                                .background(Color("Accent"))
                                .foregroundColor(Color.white)
                                .cornerRadius(25)
                        }
                    }
                }
            }.padding()
        }
    }
}

struct AdminStaffPage4_Previews: PreviewProvider {
    static var previews: some View {
        AdminStaffPage4()
    }
}
