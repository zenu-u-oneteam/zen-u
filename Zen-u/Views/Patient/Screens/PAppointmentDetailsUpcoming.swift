//
//  PAppointmentDetailsUpcoming.swift
//  Zen-u
//
//  Created by Archit Khanna on 21/04/23.
//

import SwiftUI

var PstoredAppointments:PUpcomingAppointmentDoctorDetails = PUpcomingAppointmentDoctorDetails(drName: "Dr Doctor", drField: "Oncology", cabinNo: "Cabin No. 1224", appointmentTime: "9:30 am", appointmentDate: "12/12/23")

struct PAppointmentDetailsUpcoming: View {
    
    var body: some View {
        NavigationView {
            
            ScrollView(.vertical,showsIndicators: false) {
                
                LazyVStack(spacing: 20, pinnedViews: [.sectionHeaders]){
                                        
                    PAppointmentDetailsCardView()
                    
                }
                .padding(24)
                .navigationTitle("Appointment Details")
            }
        }
    }
}

func PAppointmentDetailsCardView() -> some View{
    
    VStack(spacing: 35) {
        
        HStack {
            
            Image("image 9")
                .background(Color.white)
                .clipShape(Circle())
                .frame(width: 120 , height: 120)
            
            VStack(alignment: .leading, spacing: 5){
                
                Text(PstoredAppointments.drName)
                    .font(.title3.bold())
                                
                Text(PstoredAppointments.drField)
                    .font(.footnote.weight(.light))
                
                VStack(alignment: .leading, spacing: 2) {
                    
                    Text(PstoredAppointments.cabinNo)
                        .font(.caption)
                        .padding(8)
                        .background(Color.white, in: RoundedRectangle(cornerRadius: 15))
                    
                    HStack(spacing: 30) {
                        
                        HStack(spacing: 0) {
                            
                            Image(systemName: "calendar")
                                .font(.footnote)
                            
                            Text(PstoredAppointments.appointmentDate).font(.caption).padding(5)
                            
                        }
                        .background( RoundedRectangle(cornerRadius: 30).fill( Color(.white)) .frame(width: 90, height: 28))
                        
                        
                        HStack(spacing: 0) {
                            
                            Image(systemName: "clock").font(.caption)
                            
                            Text(PstoredAppointments.appointmentTime)
                                .font(.caption)
                                .padding(5)
                        }
                        .background( RoundedRectangle(cornerRadius: 30)
                            .fill(.white)
                            .frame(width: 90, height: 28))
                    }
                    .padding(10)
                }
            }
        }
        
        .background(RoundedRectangle(cornerRadius: 15)
            .fill(Color("Secondary"))
            .frame(width: 347, height: 170)
        )
        
        HStack(spacing: 20){
            
            Button(action: {
                
            }, label: {
                Text("Cancel")
                    .frame(maxWidth: .infinity)
                    .font(.body.weight(.semibold))
                    .foregroundColor(Color("Heading"))
                    .frame(width: 165 , height: 50)
                    .background(Color("Secondary"))
                    .cornerRadius(10)
            })
            
            Button(action: {
                
            }, label: {
                Text("Re-Schedule")
                    .frame(maxWidth: .infinity)
                    .font(.body.weight(.semibold))
                    .foregroundColor(.white)
                    .frame(width: 165 , height: 50)
                    .background(Color("Accent"))
                    .cornerRadius(10)
            })
        }
    }
    .padding(.vertical, 24)
}


struct PAppointmentDetailsUpcoming_Previews: PreviewProvider {
    static var previews: some View {
        PAppointmentDetailsUpcoming()
    }
}


