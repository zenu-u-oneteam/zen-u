//
//  Patient.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 20/04/23.
//

import Foundation

struct Patient: Hashable, Codable, Identifiable {
    var name: String?
    var id: String?
    var age: Int
    var gender: Gender
    var bloodGroup: String
    var height: Float
    var weight: Float
    var appointments: [String]?
    var pastAppointments: [String]?
    var pendingHealthRecords: [String]?
    var healthRecords: [String]?
    var medications: [String]?
    var appointmentReports: [String]?
    var aadhaar: String?
    
    enum Gender: String, CaseIterable, Codable {
        case male = "Male"
        case female = "Female"
        case others = "Others"
    }
    
    enum BloodGroup: String, CaseIterable, Codable {
        case APositive = "A+"
        case ANegative = "A-"
        case BPositive = "B+"
        case BNegative = "B-"
        case ABPositive = "AB+"
        case ABNegative = "AB-"
        case OPositive = "O+"
        case ONegative = "O-"
    }
}

struct PatientRaw: Hashable, Codable, Identifiable {
    var name: String?
    var id: String?
    var age: Int
    var gender: String
    var bloodGroup: String
    var height: Float
    var weight: Float
    var aadhaar: String?
}
