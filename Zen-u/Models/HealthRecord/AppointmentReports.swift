//
//  Prescriptions.swift
//  Zen-u
//
//  Created by Aindrila Ray on 02/05/23.
//

import Foundation
struct AppointmentReports: Hashable, Codable, Identifiable {
    var id: String
    var appointment: AppointmentRaw?
    var appointmentTime: Date
    var patient: PatientRaw?
    var doctor: DoctorRaw?
    var type: HealthRecordTypeRaw?
    var symptoms: String
    var medicalAdvice: String
    var prescriptions: String?
}
struct AppointmentReportsRaw: Hashable, Codable, Identifiable {
    var id: String?
    var appointment: String
    var appointmentTime: Int
    var patient: String
    var doctor: String
    var type: String
    var symptoms: String
    var medicalAdvice: String
    var prescriptions: String?
}

