//
//  HealthRecord.swift
//  Zen-u
//
//  Created by Aindrila Ray on 26/04/23.
//

import Foundation
struct HealthRecord: Hashable, Codable, Identifiable {
    var id: Int
    var appointmentTime: DateComponents
    var patient: Patient
    var doctor: Doctor
    var type: HealthRecordType
    var document: String
}
