//
//  Doctor.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 21/04/23.
//

import Foundation

struct Doctor: Hashable, Codable, Identifiable {
    var id: String
    var age: Int
    var gender: Gender
    var appointments: [String]?
    var name: String
    var startTime: Int
    var endTime: Int
    var cabin: Int?
    var department: String?
    var experience: String?
    var education: String?
    var languages: String?
    var specialisation: String?
    
    enum Gender: String, CaseIterable, Codable {
        case male = "Male"
        case female = "Female"
        case others = "Others"
    }
}

struct DoctorRaw: Hashable, Codable, Identifiable {
    var id: String?
    var age: Int
    var gender: String
    var appointments: [String]?
    var name: String
    var startTime: Int
    var endTime: Int
    var cabin: Int?
    var department: String?
    var experience: String?
    var education: String?
    var languages: String?
    var specialisation: String?
}
