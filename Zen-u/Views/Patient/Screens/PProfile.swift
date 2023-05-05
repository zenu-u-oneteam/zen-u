//
//  PProfile.swift
//  Zen-u
//
//  Created by Aindrila Ray on 23/04/23.
//

import SwiftUI
struct PProfile: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        VStack{
            HeaderView()
            ProfileHeaderView(user: viewModel.user, patient: viewModel.patient)
            SubHeadingView()
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    HealthKitView()
                    HealthKitView()
                    HealthKitView()
                }
            }
            Spacer()
        }
        .padding(.horizontal,15)
    }
    
    func HeaderView() -> some View {
        HStack{
            Text("Profile").font(.largeTitle.bold())
                .foregroundColor(Color("Heading"))
            Spacer()
            Menu {
                Button("Edit") {
                    viewModel.editPatient()
                }
                Button("Settings") {
                    viewModel.patientSettings()
                }
                Button("Log Out") {
                    viewModel.logout()
                    appState.rootViewId = UUID()
                }
            } label: {
                Image(systemName: "line.horizontal.3")
                    .resizable()
                    .foregroundColor(Color("Heading"))
                    .frame(width: 15, height: 13)
                    .padding(.vertical)
            } 
        }
        .padding(.top, 30)
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
