//
//  AHome.swift
//  Zen-u
//
//  Created by Tanvi Gupta on 18/04/23.
//

import SwiftUI
import FirebaseAuth

struct AHome: View {
    @EnvironmentObject var appState: AppState

    func logout() {
        do {
            UserDefaults.standard.removeObject(forKey: "currentUser")
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                //Header
                HStack {
                    VStack(alignment: .leading) {
                        Text("zen-u")
                            .font(.largeTitle.bold())
                            .foregroundColor(Color("Heading"))
                        Text("zen for you")
                            .fontWeight(.light)
                            .foregroundColor(Color("Heading"))
                        
                    }
                    Spacer()
                    Menu {
                        Button("Edit") {
                        }
                        Button("Settings") {
                        }
                        Button("Log Out") {
                            logout()
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
                
                
                //Graph
                ZStack{
                    Rectangle()
                        .fill(Color("Secondary"))
                        .frame(width: .infinity, height: 192)
                        .cornerRadius(30)
                    Image("Graph")
                }.padding(.bottom, 16)
                    .padding(.top, 25)
                
                //Today's Numbers
                VStack(alignment: .leading){
                    Text("Today's Numbers")
                        .font(.title3.weight(.semibold))
                    HStack{
                        VStack{
                            Text("16").font(.largeTitle.weight(.heavy))
                                .foregroundColor(.accentColor)
                            Text("Active Staff").font(.footnote.weight(.bold))
                        }.frame(width: 90, height: 90)
                            .background(Color("Secondary"))
                            .cornerRadius(10)
                        
                        HStack{
                            VStack{
                                Text("08").font(.largeTitle.weight(.heavy))
                                Text("Doctors")
                            }
                            
                            Spacer()
                            
                            Rectangle()
                                .frame(width: 0.75)
                                .foregroundColor(Color("Subheadings"))
                                .padding(.vertical, 20)
                            
                            Spacer()
                            
                            VStack{
                                Text("06").font(.largeTitle.weight(.heavy))
                                Text("Nurses")
                            }
                            
                            Spacer()
                            
                            Rectangle()
                                .frame(width: 0.75)
                                .foregroundColor(Color("Subheadings"))
                                .padding(.vertical, 20)
                            
                            Spacer()
                            
                            VStack{
                                Text("02").font(.largeTitle.weight(.heavy))
                                Text("Sanitation")
                            }
                        }.font(.footnote.weight(.light))
                            .padding(.horizontal, 22)
                            .frame(width: .infinity, height: 90)
                            .background(Color("Secondary"))
                            .cornerRadius(10)
                        
                    }
                    
                }
                
                //Amenities
                VStack(alignment: .leading){
                    Text("Amenities")
                        .font(.title3.weight(.semibold))
                    HStack{
                        VStack{
                            Text("08").font(.largeTitle.weight(.heavy))
                            Text("Staff")
                        }
                        
                        Group{
                            Spacer()
                            
                            Rectangle()
                                .frame(width: 0.75)
                                .foregroundColor(Color("Subheadings"))
                                .padding(.vertical, 20)
                            
                            Spacer()
                        }
                        
                        VStack{
                            Text("06").font(.largeTitle.weight(.heavy))
                            Text("Beds")
                        }
                        
                        Group{
                            Spacer()
                            
                            Rectangle()
                                .frame(width: 0.75)
                                .foregroundColor(Color("Subheadings"))
                                .padding(.vertical, 20)
                            
                            Spacer()
                        }
                        
                        VStack{
                            Text("02").font(.largeTitle.weight(.heavy))
                            Text("OTs")
                        }
                        
                        Group{
                            Spacer()
                            
                            Rectangle()
                                .frame(width: 0.75)
                                .foregroundColor(Color("Subheadings"))
                                .padding(.vertical, 20)
                            
                            Spacer()
                        }
                        
                        VStack{
                            Text("02").font(.largeTitle.weight(.heavy))
                            Text("Ambulance")
                        }
                    }.font(.footnote.weight(.light))
                        .padding(.horizontal, 22)
                        .frame(width: .infinity, height: 90)
                        .background(Color("Secondary"))
                        .cornerRadius(10)
                }.padding(.vertical, 10)
                
                //Availabilities
                VStack(alignment: .leading){
                    Text("Availabilities")
                        .font(.title3.weight(.semibold))
                    HStack{
                        VStack{
                            Text("08").font(.largeTitle.weight(.heavy))
                            Text("Surgeons")
                        }
                        
                        Group{
                            Spacer()
                            
                            Rectangle()
                                .frame(width: 0.75)
                                .foregroundColor(Color("Subheadings"))
                                .padding(.vertical, 20)
                            
                            Spacer()
                        }
                        
                        VStack{
                            Text("06").font(.largeTitle.weight(.heavy))
                            Text("Beds")
                        }
                        
                        Group{
                            Spacer()
                            
                            Rectangle()
                                .frame(width: 0.75)
                                .foregroundColor(Color("Subheadings"))
                                .padding(.vertical, 20)
                            
                            Spacer()
                        }
                        
                        VStack{
                            Text("02").font(.largeTitle.weight(.heavy))
                            Text("OTs")
                        }
                        
                        Group{
                            Spacer()
                            
                            Rectangle()
                                .frame(width: 0.75)
                                .foregroundColor(Color("Subheadings"))
                                .padding(.vertical, 20)
                            
                            Spacer()
                        }
                        
                        VStack{
                            Text("02").font(.largeTitle.weight(.heavy))
                            Text("Ambulance")
                        }
                    }.font(.footnote.weight(.light))
                        .padding(.horizontal, 22)
                        .frame(width: .infinity, height: 90)
                        .background(Color("Secondary"))
                        .cornerRadius(10)
                }
            }.padding(24)
        }
    }
}
    


struct AHome_Previews: PreviewProvider {
    static var previews: some View {
        AHome()
    }
}
