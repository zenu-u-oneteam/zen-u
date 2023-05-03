//
//  PAppointmentDetailsPast.swift
//  Zen-u
//
//  Created by Aindrila Ray on 03/05/23.
//

import SwiftUI


struct PAppointmentDetailsPast: View {
    var appointmentDetails: Appointment
    func formattedDateComponents(dateComponents: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy 'at' h:mm a"
        return dateFormatter.string(from: dateComponents)
    }
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 35) {
                    
                    HStack {
                        
                        Image("image 9")
                            .background(Color.white)
                            .clipShape(Circle())
                            .frame(width: 120 , height: 120)
                        
                        VStack(alignment: .leading, spacing: 5){
                            
                            Text(appointmentDetails.doctor?.name ?? "Dr. Doctor")
                                .font(.title3.bold())
                                .padding(.bottom, 3)
                            Text(appointmentDetails.doctor?.department ?? "General Physician")
                                .font(.footnote.weight(.light))
                                .padding(.bottom, 3)
                            
                            
                                
                            HStack{
                                        
                                        Image(systemName: "calendar")
                                            .font(.footnote)
                                        
                                        Text(formattedDateComponents(dateComponents: appointmentDetails.appointmentTime)).font(.caption)
                                           
                                    
                                    
                                        
                                    }.padding(.bottom, 10)
    
                                
                            .padding(2)
                                
                                Text("Cabin number: \(String(appointmentDetails.doctor?.cabin ?? 1224))")
                                    .font(.caption)
                                    .padding(8)
                                    .background(Color.white, in: RoundedRectangle(cornerRadius: 10))
                                    .padding(.bottom, 3)
                                
                               
                            }
                        
                    }.padding()
                    .hLeading()
                    .padding(.vertical, 10)
                    .background(Color("Secondary"))
                    .cornerRadius(15)
                    .padding(.horizontal, -3)
                   
                    if (appointmentDetails.appointmentRecord != nil){
                        Text("Record")
                            .font(.title3.bold())
                            .hLeading()
                            .padding(.leading, 4)
                            .padding(.top, 10)
                            .foregroundColor(Color("Heading"))
                        
                        VStack(alignment: .leading, spacing: 30){
                            VStack(alignment: .leading){
                                Text("Symptoms")
                                    .font(.system(size: 16))
                                    .fontWeight(.regular)
                                    .hLeading()
                                    .padding(.leading, 2)
                                //                                .padding(20)
                                //                                .padding(.top, 40)
                                    .foregroundColor(Color("Heading"))
                                Text(appointmentDetails.appointmentRecord?.symptoms ?? "none")
                                    .font(.system(size: 14))
                                    .fontWeight(.regular)
                                    .hLeading()
                                    .padding()
                                    .foregroundColor(Color("Subheadings"))
                                    .background(Color("Secondary"))
                                    .cornerRadius(10)
                                
                                
                            }
                            VStack(alignment: .leading){
                                Text("Medical Advice")
                                    .font(.system(size: 16))
                                    .fontWeight(.regular)
                                    .hLeading()
                                    .padding(.leading, 2)
                                //                                .padding(20)
                                //                                .padding(.top, 40)
                                    .foregroundColor(Color("Heading"))
                                Text(appointmentDetails.appointmentRecord?.medicalAdvice ?? "none")
                                    .font(.system(size: 14))
                                    .fontWeight(.regular)
                                    .hLeading()
                                    .padding()
                                    .foregroundColor(Color("Subheadings"))
                                    .background(Color("Secondary"))
                                    .cornerRadius(10)
                                
                                
                            }
                            
                            
                            
                            
                        }//Record details VStack
                    }
                }
                .padding(.vertical, 24)
                
               
                
            }//end of ScrollView
            .padding(24)
            .navigationTitle("Appointment Details")
        }
    }
}
struct PAppointmentDetailsPast_Previews: PreviewProvider {
    static var previews: some View {
        PAppointmentDetailsPast(appointmentDetails: Appointment(id: "1200", appointmentTime: Date.now, doctor: DoctorRaw(age: 45, gender: "Female", name: "Dr. Aindrila Ray", department: "Cardiology Department"), appointmentRecord: AppointmentReportsRaw(appointment: "1", appointmentTime: 16785900, patient: "" , doctor: "" , type: "" , symptoms: "yay yay yay ya ya", medicalAdvice: "yay yay yay ya ya" )))
    }
}
