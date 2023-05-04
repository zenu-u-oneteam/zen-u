//
//  Appointment.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 21/04/23.
//

import Foundation

struct Appointment: Hashable, Codable, Identifiable {
    var id: String
    var appointmentTime: Date
    var patient: PatientRaw?
    var doctor: DoctorRaw?
    var type: AppointmentTypeRaw?
    var bill: Bill?
    var message: String?
    var department: DepartmentRaw?
    var appointmentRecord: AppointmentReportsRaw?
}

struct AppointmentRaw: Hashable, Codable, Identifiable {
    var id: String?
    var appointmentTime: Int
    var patient: String
    var doctor: String
    var type: String
    var bill: String
    var message: String?
    var department: String?
    var appointmentRecord: String?
}
