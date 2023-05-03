//
//  HealthRecordType.swift
//  Zen-u
//
//  Created by Aindrila Ray on 26/04/23.
//

import Foundation
struct HealthRecordType: Hashable, Codable, Identifiable {
    var id: String
    var title: String
    var category: HealthCategory
    var image: String
    var description: String

}
struct HealthRecordTypeRaw: Hashable, Codable, Identifiable {
    var id: String?
    var title: String
    var category: String
    var image: String
    var description: String

}
enum HealthCategory: String, CaseIterable, Codable {
    case appointmentRecords = "Appointment Reports"
    case labreports = "Lab Reports"
    case vaccinationreports = "Vaccination Reports"
    case hospitalization = "Hospitalizations"
}
