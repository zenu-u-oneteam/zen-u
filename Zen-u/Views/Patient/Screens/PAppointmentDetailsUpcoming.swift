import SwiftUI


struct PAppointmentDetailsUpcoming: View {
    var appointmentDetails: Appointment
    func formattedDateComponents(dateComponents: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy 'at' h:mm a"
        return dateFormatter.string(from: dateComponents)
    }
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
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
                            Text(appointmentDetails.department?.name ?? "General Physician")
                                .font(.footnote.weight(.light))
                                .padding(.bottom, 3)
                            
                            
                                
                            HStack{
                                        
                                        Image(systemName: "calendar")
                                            .font(.footnote)
                                        
                                        Text(formattedDateComponents(dateComponents: appointmentDetails.appointmentTime)).font(.caption)
                                           
                                    
                                    
                                        
                                    }.padding(.bottom, 10)
    
                                
                            .padding(2)
                               }
                        
                    }.padding()
                    .hLeading()
                    .padding(.vertical, 10)
                    .background(Color("Secondary"))
                    .cornerRadius(15)
                    .padding(.horizontal, -3)
                
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
                
               
                
            }//end of ScrollView
            .padding(24)
            .navigationTitle("Appointment Details")
        }
    }
}
struct PAppointmentDetailsUpcoming_Previews: PreviewProvider {
    static var previews: some View {
        PAppointmentDetailsUpcoming(appointmentDetails: Appointment(id: "1100", appointmentTime: Date.now, doctor: DoctorRaw(age: 45, gender: "Female", name: "Dr. Aindrila Ray", startTime: 17, endTime: 24) ))
    }
}


