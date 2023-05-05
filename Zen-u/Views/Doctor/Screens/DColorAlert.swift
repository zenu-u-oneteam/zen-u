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
    @State private var title : String = ""
    @State private var color = ""
    let data = [
        GridData(id: 0, title: "Code Blue", description: "Hospital emergency code is used for critical status of a patient.",color: "CodeBlue" ) ,
        GridData(id: 1, title: "Code Pink", description: "Alerts hospital staff to a missing child or child abduction.",color: "CodePink"),
        GridData(id: 2, title: "Code Red", description: "Alerts staff to a fire or probable fire. Enforces staff to follow the fire protocols.",color: "CodeRed"),
        GridData(id: 3, title: "Code Orange", description: "Its a call for medical decontamination, usually due to a hazardous fluids spill.",color: "CodeOrange"),
        GridData(id: 4, title: "Code Green", description: "It indicates that the hospital is activating an emergency operations plan.",color: "CodeGreen"),
        GridData(id: 5, title: "Code Gray", description: "Its a call for security personnel. Indicates that there is criminal activity in the hospital..",color: "CodeGray")
    ]
    
    let columns = [        GridItem(.flexible()),        GridItem(.flexible())    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 8) {
                            ForEach(data) { item in
                                
                                GridItemView(title: item.title, description: item.description,color: item.color)
                                    .onTapGesture {
                                        print("Title : \(self.title)")
                                        self.selectedItem = item
                                        self.title = item.title
                                        self.color = item.color
                                        showModal = true
                                        
                                    }
                            }
                        }
                        
                    }
                    .padding()
                    ConfirmModalView(isShowing: $showModal,title: title,color: color)
                    
                    
                }
                
                
            }
            .searchable(text: $searchText) {
            }
            .navigationTitle("Alert Codes")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
struct GridItemView: View {
    let title: String
    let description: String
    let color: String
    
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            HStack{
                Text(title)
                
                
                    .multilineTextAlignment(.leading)
                    .font(.title .weight(.bold))
                    .foregroundColor(.white)
                
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
                    .background(Circle().frame(width: 35,height: 35).foregroundColor(Color(.white)).opacity(0.5))
                    .padding(.trailing,24)
                
                
            }
            //            Spacer()
            Text(description)
                .font(.footnote)
                .foregroundColor(.white)
                .frame(width: 151)
                .padding(.bottom,10)
        }
        .padding(.leading,10)
        .frame(width: 174 , height: 164)
        .background(Color(color))
        .cornerRadius(20)
    }
}
struct GridData: Identifiable {
    let id: Int
    let title: String
    let description: String
    let color: String
}

struct DColorAlert_Previews: PreviewProvider {
    static var previews: some View {
        DColorAlert()
    }
}

struct ConfirmModalView: View {
    @State private var showAlert = false
    @State private var message: String = ""
    @Binding var isShowing: Bool
    @State private var offset: CGFloat = 200.0
    @StateObject private var viewModel = ViewModel()
    let title: String
    let color: String
    var body: some View {
        ZStack(alignment: .bottom){
            if isShowing {
                Color.black.opacity(0.6).ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                ZStack {
                    Color.white
                    VStack{
                        HStack(alignment: .top){
                            Text("Raise Alert:")
                                .font(.title3 .weight(.semibold))
                                .foregroundColor(.black)
                            Spacer()
                            
                            Image(systemName: "xmark").foregroundColor(.white)
                                .background(
                                    Circle()
                                        .fill(Color(.black).opacity(0.2))
                                        .frame(width: 40, height: 40)
                                    
                                ).onTapGesture {
                                    isShowing = false
                                }
                            
                        }
                        TextField(
                            "Message for Admin...",
                            text: $message
                            // axis: .vertical
                        )
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(30)
                        .frame(minHeight: 100)
                        .lineLimit(nil)
                        .disableAutocorrection(true)
                        Button(action:  {
                            Task{
                                await viewModel.sendAlert(code: title, desc: message)
                                if viewModel.isLoading == false {
                                    showAlert = true
                                }
                                message = ""
                            }
                            
                           
                            
                        }) {
                            
                            Text(title)
                                .padding()
                            
                        }       .alert("Alert Sent", isPresented: $showAlert) {
                            Button("OK", role: .cancel) { isShowing = false }
                        }
                        .font(.callout .weight(.heavy))
                        .foregroundColor(.white) // 2
                        .background(Color(color)) // 3
                        .cornerRadius(10)
                        
                        
                        
                        
                    }.padding(24)
                    
                    
                    
                }.frame(height: UIScreen.main.bounds.height * 0.3)
                    .cornerRadius(19)
            }
            
        }
        .frame(maxWidth: .infinity ,maxHeight: .infinity ,alignment: .bottom)
//        .ignoresSafeArea()
        .animation(Animation.easeInOut, value: offset)
    }
}

struct RoundedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical)
            .padding(.horizontal, 24)
            .background(
                Color(UIColor.systemGray6)
            )
            .clipShape(Capsule(style: .continuous))
    }
}
struct TextFieldHeightPreference: Equatable {
    let height: CGFloat
}

struct TextFieldHeightPreferenceKey: PreferenceKey {
    static var defaultValue: TextFieldHeightPreference = TextFieldHeightPreference(height: 0)
    
    static func reduce(value: inout TextFieldHeightPreference, nextValue: () -> TextFieldHeightPreference) {
        value = nextValue()
    }
}

struct PopupView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("This is a pop-up view!")
                .font(.title)
                .padding()
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Close")
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}
