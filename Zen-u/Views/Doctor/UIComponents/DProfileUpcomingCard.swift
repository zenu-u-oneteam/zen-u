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
                Text(appointmentDetails.patient!.name!)
                    .font(.body.weight(.semibold))
                    .padding(.top, 3)
                Text("\(appointmentDetails.patient!.age) years old")
                    .font(.callout)
                    .padding(.top, 2)
                Text(appointmentDetails.patient!.gender)
                    .font(.callout)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 10) {
                Text(formatDate(appointmentDetails.appointmentTime))
                    .font(.largeTitle.bold())
                HStack {
                    if (checkStatus(appointmentDetails.appointmentTime)) {
                        Tag(text: "Live", highlited: highlited)
                    }
                    Tag(text: "New Patient", highlited: highlited)
                }
                
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
        let appointmentDetails: Appointment = Appointment(id: "12345", appointmentTime: Date(), patient: PatientRaw(name:"Test User", age: 20, gender: "Male", bloodGroup: "o+", height: 182.2, weight: 50.0), type: AppointmentTypeRaw(name: "PSV23 (Pneumo)", amount: 123, category: "General", department: "General"))
        DProfileUpcomingCard(appointmentDetails: appointmentDetails)
    }
}
