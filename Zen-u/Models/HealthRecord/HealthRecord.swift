//
//  HealthRecord.swift
//  Zen-u
//
//  Created by Aindrila Ray on 26/04/23.
//

import Foundation
struct HealthRecord: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var appointmentTime: Date
    var patient: String
    var doctor: String
    var type: HealthCategory
    var document: String
}

enum HealthCategory: String, CaseIterable, Codable {
    case prescription = "Prescription"
    case labreports = "Lab Reports"
    case vaccinationreports = "Vaccination Reports"
    case hospitalization = "Hospitalization"
}
