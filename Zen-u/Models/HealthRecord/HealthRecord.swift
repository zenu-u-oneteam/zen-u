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
    var patient: PatientRaw?
    var doctor: DoctorRaw?
    var type: HealthRecordTypeRaw?
    var document: String
}

struct PendingHealthRecord: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var appointmentTime: Date
    var patient: PatientRaw?
    var doctor: DoctorRaw?
    var type: HealthRecordTypeRaw?
}




struct HealthRecordRaw: Hashable, Codable, Identifiable {
    var id: String?
    var name: String
    var appointmentTime: Int
    var patient: String
    var doctor: String
    var type: String
    var document: String
}
struct PendingHealthRecordRaw: Hashable, Codable, Identifiable {
    var id: String?
    var name: String
    var appointmentTime: Int
    var patient: String
    var doctor: String
    var type: String
}


