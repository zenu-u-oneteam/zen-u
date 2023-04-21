//
//  ScheduleSettings.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI

struct PScheduleSettings: View {
    @StateObject var appointmentViewModel: ViewModel = ViewModel()
    @Namespace var animation
    @State var function1Active = false
    @State var function2Active = false
    @State var function3Active = false
    @State var function4Active = false
    @State var function5Active = false
    @State var function6Active = false
    var body: some View{
        
        
        
        NavigationView() {
            ScrollView(.vertical,showsIndicators: false){
                LazyVStack(spacing: 30, pinnedViews: [.sectionHeaders]){
                    
                    Section{
                        
                    
                        ScrollView(.horizontal, showsIndicators: false){
                            
                            
                            
                                HStack(spacing: 12){
                                    
                                    ForEach(appointmentViewModel.currentWeek, id:  \.self){day in
                                        
                                        VStack(spacing: 10){
                                            
                                            Text(appointmentViewModel.extractDate(date: day, format: "dd"))
                                                .font(.system(size: 15))
                                                .fontWeight(.semibold)
                                            
                                            Text(appointmentViewModel.extractDate(date: day, format: "EEE"))
                                                .font(.system(size: 14))
                                            
                                            //                                    Circle()
                                            //                                        .fill(.white)
                                            //                                        .frame(width: 8, height: 8)
                                            //                                        .opacity(appointmentViewModel.isToday(date: day) ? 1 : 0)
                                        }
                                        
                                        .foregroundStyle(appointmentViewModel.isToday(date: day) ? .primary : .secondary)
                                        .foregroundColor(appointmentViewModel.isToday(date: day) ? .white : .black)
                                        .frame(width: 60, height: 80)
                                        .background(
                                            ZStack{
                                                if appointmentViewModel.isToday(date: day){
                                                    Rectangle()
                                                        .fill(.blue)
                                                        .cornerRadius(20)
                                                        .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                                    
                                                }
                                                else{
                                                    Rectangle()
                                                        .fill((Color(red: 239/255, green: 239/255, blue: 239/255)))
                                                        .cornerRadius(20)
                                                    
                                                }
                                            }
                                        )
                                        .contentShape(Capsule())
                                        .onTapGesture {
                                            appointmentViewModel.currentDay = day
                                        }
                                        
                                    }
                                
                            }
                            .padding()
                            .padding(.horizontal)
                        }.padding(-30)
                        TaskView()
                    
                        
                    } header: {
                        headerView()
                            
                        
                    }
                }
            }.ignoresSafeArea(.container, edges: .trailing)
                .padding()
//                .navigationBarItems(trailing :NavigationLink(destination: {TestView()}, label: {Image(systemName: "person")})
                                        
                
        }
    }
    
    func TaskView()->some View{
        
        
        
        
        VStack(alignment : .leading , spacing:25){
            
           
                
            Divider()
                            
            
            Text("Select a slot")
//                .hLeading()
                .font(.title2)
            
            
            HStack(spacing:20){
                
                Button(action: { self.function1Active.toggle()},
                       label: {
                    PSpecialButton(buttonText: "Time Slot",
                                  buttonColor: Color("blue"),
                                  active: function1Active)
                })
                
                Button(action: { self.function2Active.toggle()},
                       label: {
                    PSpecialButton(buttonText: "Time Slot",
                                  buttonColor: Color("Blue"),
                                  active: function2Active)
                })
                
                Button(action: { self.function3Active.toggle()},
                       label: {
                    PSpecialButton(buttonText: "Time Slot",
                                  buttonColor: Color("Gray"),
                                  active: function3Active)
                })
            }
            
            VStack(spacing: 90){
                
                HStack(spacing: 20){
                    
                    Button(action: { self.function4Active.toggle()},
                           label: {
                        PSpecialButton(buttonText: "Time Slot",
                                       buttonColor: Color("blue"),
                                       active: function4Active)
                    })
                    
                    Button(action: { self.function5Active.toggle()},
                           label: {
                        PSpecialButton(buttonText: "Time Slot",
                                       buttonColor: Color("blue"),
                                       active: function5Active)
                    })
                    
                    Button(action: { self.function6Active.toggle()},
                           label: {
                        PSpecialButton(buttonText: "Time Slot",
                                       buttonColor: Color("blue"),
                                       active: function6Active)
                    })
                }
//                }.hCenter()
//                    .padding()
                
               
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Text("Continue")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .font(.title3)
                            .foregroundColor(.white)
                            .frame(width: 341 , height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                        
                    })
                    
                
            }
        }.hCenter()
    }
    func headerView() ->some View{
        HStack(spacing: 10){
            VStack(alignment: .leading, spacing: 10) {
                
                
                Button(action: {
                    
                }, label: {
                    
                    Image("chevron.left")
                        
                })
                
//                Text(Date().formatted(date: .abbreviated, time: .omitted)).foregroundColor(.gray)
                
                VStack(spacing: 40){
                    Text("Booking Consultation").font(.largeTitle.bold()).hLeading()
                    
                    Text("Select Schedule").font(.title2).hLeading()
                    
                
                    
                }
            }
            .padding(.top)
            .hLeading()

            Button {

            }   label: {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                    .padding(.top)
                    
            }
        }
    }
}

struct ScheduleSettings_Previews: PreviewProvider {
    static var previews: some View {
        PScheduleSettings()
    }
}


    func getSafeArea()->UIEdgeInsets{
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
    
    
    

//struct TestView: View {
//    var body: some View {
//        VStack{
//            Color.mint
//        }
//    }
//}

