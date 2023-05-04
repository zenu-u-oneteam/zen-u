//
//  DProfileUpcomingCard.swift
//  Zen-u
//
//  Created by Prakhar Singh on 04/05/23.
//

import SwiftUI

struct DProfileUpcomingCard: View {
    var appointmentDetails: Appointment
    var highlited: Bool = false
    
    func formatDate(_ date: Date) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "HH:mm"
        return dateFormat.string(from: date)
    }
    
    func checkStatus(_ date: Date) -> Bool {
        let appointmentTime = Int(date.timeIntervalSince1970)
        let currentTime = Int(Date().timeIntervalSince1970)
        let interval = 30 * 60
        if ((currentTime - appointmentTime) <= interval && (currentTime - appointmentTime) >= 0) {
            return true
        }
        return false
    }
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(appointmentDetails.type!.name)
                    .font(.body.weight(.semibold))
                HStack {
                    Tag(text: appointmentDetails.type!.category, highlited: highlited)
                    if (checkStatus(appointmentDetails.appointmentTime)) {
                        Tag(text: "Live", highlited: highlited)
                    }
                }
                .padding(.top, 3.0)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(formatDate(appointmentDetails.appointmentTime))
                    .font(.largeTitle.bold())
                Text(appointmentDetails.doctor!.name)
                    .font(.subheadline.bold())
            }
        }
        .padding()
        .foregroundColor(highlited ? .white : Color("Heading"))
        .background(highlited ? Color("Accent") : Color("Secondary"))
        .cornerRadius(17)
    }
    
    private struct Tag: View {
        var text: String
        var highlited: Bool
        
        var body: some View {
            HStack {
                Text(text)
                    .font(.footnote.weight(.semibold))
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(highlited ? (text != "Live") ? Color.white.opacity(0.9) : Color.white : Color.white)
            .foregroundColor((text == "Live") ? Color.red : highlited ? Color("Accent") : Color("Heading"))
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke((text == "Live") ? .red : .white, lineWidth: 3)
            )
            .cornerRadius(5)
        }
    }
}

struct DProfileUpcomingCard_Previews: PreviewProvider {
    static var previews: some View {
        let appointmentDetails: Appointment = Appointment(id: "12345", appointmentTime: Date(), doctor: DoctorRaw(age: 45, gender: "Male", name: "Dr. Hanna Fiegel", startTime: 0, endTime: 0), type: AppointmentTypeRaw(name: "PSV23 (Pneumo)", amount: 123, category: "General", department: "General"))
        DProfileUpcomingCard(appointmentDetails: appointmentDetails)
    }
}


//var patientName: String
//var tags : [String]
//var time: String
//var age: Int
//var gender: String
//
//var body: some View {
//    HStack(alignment: .top) {
//
////            Spacer()
//
//        HStack{
//            VStack(alignment: .center){
//                ZStack{
//                    Circle()
//                        .fill(.white)
//                        .frame(width: 70, height: 70)
//                    Image("Image")
//                        .resizable()
//                        .frame(width: 55, height: 50)
//
//                }
//                HStack {
//                    ForEach(tags, id:  \.self) {tag in
//                        Tag(text: tag)
//                    }
//                }
////                    .frame(width: 100)
//
//            }
//
//            VStack(alignment: .leading){
//                Text(patientName)
//                    .fontWeight(.bold)
//                    .foregroundColor(Color("Heading"))
//                Text("\(age)")
//                    .font(.callout)
//                    .foregroundColor(Color("Subheadings"))
//                Text(gender)
//                    .font(.callout)
//                    .foregroundColor(Color("Subheadings"))
//            }
//
//            .padding(.top, -20)
//        }
//
//        Spacer()
//
//        VStack(alignment: .leading, spacing: 5) {
//            HStack{
//                Image(systemName: "clock")
//                    .foregroundColor(.accentColor)
//                Text(time)
//                    .foregroundColor(.accentColor)
//                    .font(.callout.weight(.light))
//            }
////                .padding()
//
//        }
//
//    }
//    .padding()
//    .frame(width: 295)
//    .foregroundColor(Color("Heading"))
//    .background(Color("Secondary"))
//    .cornerRadius(20)
//}
//
//private struct Tag: View {
//    var text: String
//
//    var body: some View {
//        Text(text)
//            .font(.caption2.weight(.semibold))
//            .padding(.horizontal, 5)
//            .padding(.vertical, 5)
//            .background(Color("Tag"))
//            .foregroundColor(Color.white)
//            .cornerRadius(5)
//    }
//}
//}
