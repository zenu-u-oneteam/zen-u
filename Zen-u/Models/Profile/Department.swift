//
//  Department.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 21/04/23.
//

import Foundation

struct Department: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var doctors: [Doctor]
    var appointmentType: [AppointmentType]
    var timeSlotAvailable: [DateComponents: Doctor]
    var bookedSlots: [DateComponents: Appointment]
}
