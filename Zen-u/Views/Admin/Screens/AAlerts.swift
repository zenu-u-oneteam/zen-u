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
    @State private var showAlert = false
    @State var selectedIndex = -1
    
    
    @State var resolvedList : [AlertModelMy] = []
    @State var unresolvedList : [AlertModelMy] = []

    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else {
                VStack{
                    SegmentedPicker($isResolvedIndex, selections: options)
                    
                    
                    
                    Spacer(minLength: 20)
                    
                    if isResolvedIndex == 0 {
                        
                        ScrollViewReader {
                            value in
                            ScrollView {
                                
                                LazyVStack (spacing : 30 ){
                                    ForEach(viewModel.unResolvedalertList.indices, id: \.self) { index in
                                        AlertCard(code: viewModel.unResolvedalertList[index].code, date: DateViewModel().getDateFromDate(date: viewModel.unResolvedalertList[index].datetime), time: DateViewModel().getTimeFromDate(date: viewModel.unResolvedalertList[index].datetime), desc: viewModel.unResolvedalertList[index].description)
                                            .onTapGesture {
                                                showAlert = true
                                                selectedIndex = index
                                            }
                                            .alert(isPresented: $showAlert) {
                                                Alert(
                                                    title: Text("Mark as Resolved ?"),
                                                    
                                                    primaryButton: .default(
                                                        Text("Yes"),
                                                        action: {
                                                            Task {
                                                                let id = viewModel.unResolvedalertList[selectedIndex].id!
                                                                print(id)
                                                                await viewModel.setAsResolved(id: id)
                                                                
                                                                viewModel.update()
                                                                
                                                            }
                                                        }
                                                    ), secondaryButton: .destructive(
                                                        Text("Cancel"),
                                                        action: {}
                                                    )
                                                )
                                            }
                                        
                                        
                                    }
                                }
                            }
                        }
                        
                    } else {
                        
                        
                        ScrollViewReader {
                            value in
                            ScrollView{
                                LazyVStack (spacing : 30 ){
                                    ForEach(viewModel.resolvedalertList.indices, id: \.self) { index in
                                        AlertCard(code: viewModel.resolvedalertList[index].code, date: DateViewModel().getDateFromDate(date: viewModel.resolvedalertList[index].datetime), time: DateViewModel().getTimeFromDate(date: viewModel.resolvedalertList[index].datetime), desc: viewModel.resolvedalertList[index].description)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(24)
                .navigationTitle("Raised Alerts")
                .toolbar {
                    Button {
                        viewModel.update()
                    } label: {
                        Label("Refresh", systemImage: "arrow.clockwise" )
                    }
                }
                .accentColor(Color("Accent"))
            }
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
            Text(code)
                .font(.title .weight(.bold))
                .foregroundColor(.white)
                .padding(.bottom,8)
            
            
            HStack{
                Text("Date: \(date)")
                    .font(.headline .weight(.bold))
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "clock.fill")
                    .foregroundColor(.white)
                
                Text("\(time)").font(.headline .weight(.bold))
                    .foregroundColor(.white)
            }
            Spacer()
            Divider()
                .frame(height: 2)
                .overlay(.white)
                .padding(.bottom, 8)
            
            
            Text("\(desc)")
                .font(.title3 .weight(.semibold))
                .foregroundColor(.white)
            
        }
        .padding(24)
        .background(Color(setColor(codeString: code)))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}
struct AAlerts_Previews: PreviewProvider {
    static var previews: some View {
        AAlerts()
    }
}

func setColor(codeString : String) -> String {
    if codeString == "Code Blue"{
        return "CodeBlue"
    }
    else if codeString == "Code Orange"{
        return "CodeOrange"
    }
    else if codeString == "Code Red"{
        return "CodeRed"
    }
    else if codeString == "Code Pink"{
        return "CodePink"
    }
    else if codeString == "Code Gray"{
        return "CodeGray"
    }
    else if codeString == "Code Green"{
        return "CodeGreen"
    }
    else{
        return "Secondary"
    }
}
