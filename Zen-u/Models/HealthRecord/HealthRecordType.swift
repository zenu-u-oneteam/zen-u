//
//  HealthRecordType.swift
//  Zen-u
//
//  Created by Aindrila Ray on 26/04/23.
//

import Foundation
struct HealthRecordType: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var amount: Float
    var category: HealthCategory
    var image: String
    var description: String

    
    enum HealthCategory: String, CaseIterable, Codable {
        case prescription = "Prescription"
        case labreports = "Lab Reports"
        case vaccinationreports = "Vaccination Reports"
        case hospitalization = "Hospitalization"
    }
}
