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
            SubHeadingView().padding(.bottom, 17)
            HStack{
                
                HealthKitView().hLeading().padding()
                HealthKitView().hLeading().padding()
            }
        }
        .padding(2)
        
    }
    
    func HeaderView() -> some View {
        HStack{
            VStack(alignment: .leading) {
                Text(" ").font(.largeTitle.bold())
                    .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                    .padding(.all, 10)
            }
            .hLeading()
            
            
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
                .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                .frame(width: 15, height: 13)
                .padding(.all, 20)
        }
            
        }
    }
    
    
    func SubHeadingView() -> some View {
        VStack(alignment: .leading){
            Text("Data from Healthkit").font(.system(size: 20)).bold()
                .hLeading()
                .padding(.all, 10)
                .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
            
            
        }.padding(.top, 43)
    }
}

struct PProfile_Previews: PreviewProvider {
    static var previews: some View {
        PProfile()
    }
}
