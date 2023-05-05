//
//  DHome.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI

struct DHome: View {
    @State var path: NavigationPath = NavigationPath()
    @StateObject private var viewModel = ViewModel()
    @State private var showingSheet = false
    
    var body: some View {
        
        NavigationStack(path: $path) {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else {
                VStack {
                    HStack{
                        VStack(alignment: .leading){
                            Text(viewModel.greeting)
                                .fontWeight(.light)
                                .foregroundColor(Color("Heading"))
                            Text(viewModel.userName)
                                .font(.largeTitle.bold())
                                .foregroundColor(Color("Heading"))
                        }
                        
                        Spacer()
                        
                        ZStack{
                            Button{
                                showingSheet.toggle()
                            } label: {
                                Image(systemName: "person.fill")
                                    .foregroundColor(Color("Heading"))
                                    .frame(width: 20,height: 20)
                                    .background(Circle()
                                        .stroke(Color.white,lineWidth: 3)
                                        .background(Circle().fill(Color("Secondary")))
                                        .frame(width: 40,height: 40)
                                    )
                            }
                            .sheet(isPresented: $showingSheet) {
                                DProfile()
                            }
                        }
                        .padding()
                    }
                    
                    //working shifts
                    
                    ZStack(alignment: .leading){
                        Rectangle()
                            .fill(Color("Secondary"))
                            .frame(height: 60)
                            .cornerRadius(10)
                        
                        HStack{
                            Text("Working Hours")
                                .font(.callout.weight(.light))
                                .padding(.leading)
                            Spacer()
                            HStack{
                                Image(systemName: "clock")
                                    .foregroundColor(.accentColor)
                                Text("\(viewModel.shiftTime[0]):00-\(viewModel.shiftTime[1]):00")
                                    .foregroundColor(.accentColor)
                                    .font(.callout.weight(.light))
                            }
                            .padding(.trailing)
                        }
                        .frame(height: 90)
                        .background(Color("Secondary"))
                        .cornerRadius(13)
                        
                    }
                    
                    //today's agenda
                    
                    VStack(alignment: .leading){
                        Text("Today's agenda")
                            .font(.title3.weight(.semibold))
                            .padding(.vertical, 10)
                        
                        HStack{
                            ZStack{
                                
                                VStack{
                                    Text("\(viewModel.upcomingAppointments.count)")
                                        .font(.largeTitle.weight(.heavy))
                                        .foregroundColor(.accentColor)
                                    
                                    Text("Total patients")
                                        .font(.footnote.weight(.thin))
                                }
                                .frame(width: 95, height: 90)
                                .background(Color("Secondary"))
                                .cornerRadius(13)
                            }
                            
                            ZStack{
                                HStack{
                                    VStack{
                                        Text("\(viewModel.upcomingAppointments.count)")
                                            .font(.largeTitle.weight(.heavy))
                                            .foregroundColor(Color("Heading"))
                                        
                                        Text("OPDs")
                                            .font(.footnote.weight(.thin))
                                    }
                                    Spacer()
                                    Rectangle()
                                        .frame(width: 0.75)
                                        .foregroundColor(Color("Subheadings"))
                                        .padding(.vertical, 20)
                                    
                                    Spacer()
                                    
                                    VStack{
                                        Text("0")
                                            .font(.largeTitle.weight(.heavy))
                                            .foregroundColor(Color("Heading"))
                                        
                                        Text("Meetings")
                                            .font(.footnote.weight(.thin))
                                    }
                                    Spacer()
                                    Rectangle()
                                        .frame(width: 0.75)
                                        .foregroundColor(Color("Subheadings"))
                                        .padding(.vertical, 20)
                                    Spacer()
                                    VStack{
                                        Text("0")
                                            .font(.largeTitle.weight(.heavy))
                                            .foregroundColor(Color("Heading"))
                                        
                                        Text("Operations")
                                            .font(.footnote.weight(.thin))
                                    }
                                }
                                .padding(.horizontal, 15)
                            }
                            .frame(height: 90)
                            .background(Color("Secondary"))
                            .cornerRadius(13)
                            
                        }
                        // upcoming patient tile
                        ScrollView(showsIndicators: false) {
                            if(viewModel.upcomingAppointments.count > 0) {
                                VStack(alignment: .leading,spacing: 20) {
                                    Text("Today's Appointments")
                                        .font(.body.weight(.semibold))
                                        .padding(.top, 20)
                                    
                                    ForEach(viewModel.upcomingAppointments.indices, id: \.self) { item in
                                        Button {
                                            
                                        } label: {
                                            NavigationLink(destination: DAppointmentDetails(appointmentDetails: viewModel.upcomingAppointments[item])){
                                                DProfileUpcomingCard(appointmentDetails: viewModel.upcomingAppointments[item].appointment)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.large)
        .accentColor(Color("Accent"))
    }
}

struct DHome_Previews: PreviewProvider {
    static var previews: some View {
        DHome()
    }
}
