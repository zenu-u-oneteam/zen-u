
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
                
                
                }
                .padding(.vertical, 24)
                
                VStack(alignment: .leading){
                    Text("Record")
                        .font(.title3.bold())
                        .hLeading()
                        .padding(13)
                        .foregroundColor(Color("Heading"))
                    VStack(alignment: .leading){
                        Text("Symptoms")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .padding(20)
                            .foregroundColor(Color("Heading"))
                        Text(appointmentDetails.appointmentRecord?.symptoms ?? "none")
                            .font(.system(size: 14))
                            .fontWeight(.regular)
                            .hLeading()
                            .padding(20)
                            .foregroundColor(Color("Subheadings"))
                            .background(Color("Secondary"))
                            .cornerRadius(15)
                            .padding(.horizontal, 15)
                        
                    }.hLeading()
                    
                    VStack(alignment: .leading){
                        Text("Medical Advice")
                            .font(.system(size: 16))
                            .hLeading()
                            .padding(20)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Heading"))
                        Text(appointmentDetails.appointmentRecord?.medicalAdvice ?? "none")
                            .font(.system(size: 14))
                            .fontWeight(.regular)
                            .hLeading()
                            .padding(20)
                            .foregroundColor(Color("Subheadings"))
                            .background(Color("Secondary"))
                            .cornerRadius(15)
                            .padding(.horizontal, 15)
                    }.hLeading()
                    
                    if(appointmentDetails.appointmentRecord?.prescriptions != nil) {
                        VStack(alignment: .leading){
                            Text("Prescriptions")
                                .font(.system(size: 16))
                                .hLeading()
                                .padding(20)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Heading"))
                            Text(appointmentDetails.appointmentRecord?.prescriptions ?? "none")
                                .font(.system(size: 14))
                                .fontWeight(.regular)
                                .hLeading()
                                .padding(20)
                                .foregroundColor(Color("Subheadings"))
                                .background(Color("Secondary"))
                                .cornerRadius(15)
                                .padding(.horizontal, 15)
                        }.hLeading()
                    }
                }
                
               
                
            }//end of ScrollView
            .padding(24)
            .navigationTitle("Appointment Details")
        }
    }
}
struct PAppointmentDetailsPast_Previews: PreviewProvider {
    static var previews: some View {
        PAppointmentDetailsPast(appointmentDetails: Appointment(id: "1100", appointmentTime: Date.now, doctor: DoctorRaw(age: 45, gender: "Female", name: "Dr. Aindrila Ray", startTime: 17, endTime: 24, cabin: 123, department: "Cardiology Department"), appointmentRecord: AppointmentReportsRaw(appointment: "" , appointmentTime: 120000, patient: "", doctor: "", type: "" , symptoms: "yada yada yada", medicalAdvice: "yada yada yada", prescriptions: "yada yada yada")))
    }
}
