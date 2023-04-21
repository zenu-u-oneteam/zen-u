//
//  Appointment.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 21/04/23.
//

import Foundation

struct Appointment: Hashable, Codable, Identifiable {
    var id: Int
    var appointmentTime: DateComponents
    var patient: Patient
    var doctor: Doctor
    var department: Department
    var bill: Bill
}
