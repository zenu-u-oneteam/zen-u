//
//  AppointmentCard.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 22/04/23.
//

import SwiftUI

struct AppointmentCard: View {
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

struct AppointmentCard_Previews: PreviewProvider {
    static var previews: some View {
        let appointmentDetails: Appointment = Appointment(id: "12345", appointmentTime: Date(), doctor: DoctorRaw(age: 45, gender: "Male", name: "Dr. Hanna Fiegel", startTime: 9, endTime: 17), type: AppointmentTypeRaw(name: "PSV23 (Pneumo)", amount: 123, category: "General", department: "General"))
        AppointmentCard(appointmentDetails: appointmentDetails)
    }
}
