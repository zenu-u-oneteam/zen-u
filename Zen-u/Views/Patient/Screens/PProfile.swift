//
//  PProfile.swift
//  Zen-u
//
//  Created by Aindrila Ray on 23/04/23.
//

import SwiftUI
struct PProfile: View {
    @EnvironmentObject var appState: AppState
    @State var showMenu = false
    @State private var selectedOption = "Option 1"
    @State var userType: UserType = .none
    
    var body: some View {
        VStack{
            HeaderView()
            ProfileHeaderView()
            SubHeadingView()
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    HealthKitView()
                    HealthKitView()
                    HealthKitView()
                }
            }
            Spacer()
        }.padding(.horizontal,15)
    }
    
    func HeaderView() -> some View {
        HStack{
            Text("Profile").font(.largeTitle.bold())
                .foregroundColor(Color("Heading"))
            Spacer()
            Menu {
                Button("Edit") {
                    self.selectedOption = "Option 1"
                }
                Button("Settings") {
                    self.selectedOption = "Option 2"
                }
                Button("Log Out") {
                    self.selectedOption = "Option 3"
                    print("LOGOUT!!!")
                    UserDefaults.standard.removeObject(forKey: "currentUser")
                    appState.rootViewId = UUID()
                }
            }
        label: {
            Image(systemName: "line.horizontal.3")
                .resizable()
                .foregroundColor(Color("Heading"))
                .frame(width: 15, height: 13)
                .padding(.vertical)
        } 
        }
    }
    
    
    func SubHeadingView() -> some View {
        HStack(){
            Text("Data from Healthkit").font(.title3).bold()
                .foregroundColor(Color("Heading"))
            Spacer()
        }
        .padding(.vertical, 10)
    }
}

struct PProfile_Previews: PreviewProvider {
    static var previews: some View {
        PProfile()
    }
}
