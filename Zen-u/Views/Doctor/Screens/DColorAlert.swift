//
//  DColorAlert.swift
//  Zen-u
//
//  Created by Harsh Kelawala on 28/04/23.
//


import SwiftUI

struct DColorAlert: View {
    @State private var searchText = ""
    @State private var selectedItem: GridData? = nil
    @State private var showModal = false
    @State private var title = ""
    let data = [        GridData(id: 0, title: "Code Blue", description: "Description 1",color: .systemBlue) ,
                        GridData(id: 1, title: "Title 2", description: "Description 2",color: .systemGreen),
                        GridData(id: 2, title: "Title 3", description: "Description 3",color: .systemYellow)]
    
    let columns = [        GridItem(.flexible()),        GridItem(.flexible())    ]
                        
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(data) { item in
                                
                                    GridItemView(title: item.title, description: item.description,color: item.color)
                                    .onTapGesture {
                                        print("Title : \(self.title)")
                                        self.selectedItem = item
                                        self.title = item.title
                                        showModal = true
                                        print("Tapped")
                                    
                                }
                            }
                        }
                        
                    }.padding()
                    ConfirmModalView(isShowing: $showModal,title: title)
                    
                    
                }
                

            }
            .searchable(text: $searchText) {
                Text("Search")
            }
            .navigationTitle("Alert Codes")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
struct GridItemView: View {
    let title: String
    let description: String
    let color: UIColor
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 50){
                Text(title)
                    .font(.title .weight(.bold))
                    .foregroundColor(.white)
                    .frame(width: 70)
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
                    .background(Circle().frame(width: 35,height: 35).foregroundColor(Color(.white)).opacity(0.5))
                
                
            }.padding(.init(top: 4, leading: 4, bottom: 0, trailing: 0))
           
            Text(description)
                .font(.footnote)
                .foregroundColor(.white)
                .frame(width: 151)
                .padding(.bottom,10)
        }.padding(24)
        .background(RoundedRectangle(cornerRadius: 20  ).frame(width: 174,height: 164).foregroundColor(Color(uiColor: .systemBlue)))
        
//        .frame(width: 174,height: 164)
//        .cornerRadius(20)
//        .padding()
////        .background(Color(uiColor: color))
//        .cornerRadius(8)
//        .shadow(radius: 4)
    }
}
struct GridData: Identifiable {
    let id: Int
    let title: String
    let description: String
    let color: UIColor
}

struct DColorAlert_Previews: PreviewProvider {
    static var previews: some View {
//        GridItemView(title: "Code Blue", description: "Hospital emergency code is used for critical status of a patient", color: .systemBlue)
        DColorAlert()
    }
}

struct ConfirmModalView: View {
    @Binding var isShowing: Bool
    @State private var offset: CGFloat = 200.0
    let title: String
    var body: some View {
        ZStack(alignment: .bottom){
            if isShowing {
                Color.black.opacity(0.3).ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                ZStack {
                    Color.blue
                    Text("You clicked \(title) on item:")
                        .font(.title)
                        .foregroundColor(.black)
                    Button(action: {
                        
                    }, label: {
                        Text(title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    })
                    HStack{
                        Spacer()
                        Image(systemName: "xmark").background(
                            Circle()
                                .fill(Color(.black))
                                .frame(width: 40, height: 40)
                            
                        ).onTapGesture {
                            isShowing = false
                        }
                    }
                }.frame(height: UIScreen.main.bounds.height * 0.5)
            }
            
        }
        .frame(maxWidth: .infinity ,maxHeight: .infinity ,alignment: .bottom)
            .ignoresSafeArea()
            .animation(Animation.easeInOut, value: offset)
    }
}
