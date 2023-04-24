//
//  PAppointmentDetailsUpcoming.swift
//  Zen-u
//
//  Created by Archit Khanna on 21/04/23.
//

import SwiftUI


var PstoredAppointments:PUpcomingAppointmentDoctorDetails = PUpcomingAppointmentDoctorDetails(drName: "Dr Doctor", drField: "Oncology", cabinNo: "Cabin No. 1224", appointmentTime: "9:30 am", appointmentDate: "12/12/23")

struct PAppointmentDetailsUpcoming: View {
    //    @State var upcomingAppointmentsViewModel: PUpcomingAppointments = PViewModel()
    var body: some View {
        NavigationView(){
            
            
            ScrollView(.vertical,showsIndicators: false){
                
                LazyVStack(spacing: 20, pinnedViews: [.sectionHeaders]){
                    
                    Section{
                        
                        
                    } header: {
                        AppointmentDetailsHeaderView()
                            .padding(.bottom)
                    }
                    
                    PAppointmentDetailsCardView()
                    
                }.padding(24)
                
                
            }
        }
    }
}

func AppointmentDetailsHeaderView()->some View{
    
    VStack(spacing: 10){
        
        Text("Appointment Details").font(.system(size: 41, weight: .semibold)).hLeading()
        
    }
    
}

func PAppointmentDetailsCardView()->some View{
    
    
    
    VStack( spacing: 35) {
        
        HStack{
            
            
            Image("image 9")
                .background(Color.white)
                .clipShape(Circle())
                .frame(width: 120 , height: 120)
            
            
            
            
            VStack(alignment: .leading, spacing: 5){
                
                Text(PstoredAppointments.drName)
                    .font(.system(size: 20, weight: .bold))
                
                
                
                Text(PstoredAppointments.drField)
                    .font(.system(size: 14, weight: .light))
                
                
                
                VStack(alignment: .leading, spacing: 2){
                    
                    Text(PstoredAppointments.cabinNo)
                        .font(.system(size: 12)).padding(8)
                        .background(Color.white, in: RoundedRectangle(cornerRadius: 15))
                    
                    
                    HStack(spacing: 30){
                        
                        HStack(spacing: 0){
                            
                            Image(systemName: "calendar").font(.system(size: 14))
                            
                            Text(PstoredAppointments.appointmentDate).font(.system(size: 12)).padding(5)
                            
                            
                            
                            
                            
                        }.background( RoundedRectangle(cornerRadius: 30).fill( Color(.white)) .frame(width: 90, height: 28))
                        
                        
                        HStack(spacing: 0){
                            
                            Image(systemName: "clock").font(.system(size: 12))
                            
                            Text(PstoredAppointments.appointmentTime).font(.system(size: 12)).padding(5)
                            
                            
                            
                            
                            
                        }.background( RoundedRectangle(cornerRadius: 30).fill( Color(.white)) .frame(width: 90, height: 28))
                        
                    }.padding(10)
                    
                }
                
                
            }
            
            
        }
        
        .background( RoundedRectangle(cornerRadius: 15).fill(Color(red: 239/255, green: 239/255, blue: 239/255)).frame(width: 347, height: 170))
        
        
        HStack(spacing: 20){
            
            Button(action: {
                
            }, label: {
                Text("Cancel")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 165 , height: 50)
                    .background(Color(red: 239/255, green: 239/255, blue: 239/255))
                    .cornerRadius(10)
                    .hTrailing()
                
            })
            
            Button(action: {
                
            }, label: {
                Text("Re-Schedule")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 165 , height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .hLeading()
                
                
            })
            
        }
        
    }
    
    
    
}


struct PAppointmentDetailsUpcoming_Previews: PreviewProvider {
    static var previews: some View {
        PAppointmentDetailsUpcoming()
    }
}


