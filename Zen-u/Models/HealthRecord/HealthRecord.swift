//
//  HealthRecord.swift
//  Zen-u
//
//  Created by Aindrila Ray on 26/04/23.
//

import Foundation
struct HealthRecord: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var appointmentTime: DateComponents
    var patient: Patient
    var doctor: Doctor
    var type: HealthCategory
    var document: String
}
enum HealthCategory: String, CaseIterable, Codable {
    case prescription = "Prescription"
    case labreports = "Lab Reports"
    case vaccinationreports = "Vaccination Reports"
    case hospitalization = "Hospitalization"
}
