//
//  Appointment.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 21/04/23.
//

import Foundation

struct Appointment: Hashable, Codable, Identifiable {
    var id: String
    var appointmentTime: Data
    var patient: String
    var doctor: String
    var type: String
    var bill: String
}
