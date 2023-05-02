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
    var appointment: [String]?
    var name: String
    var startTime: Int
    var endTime: Int
    
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
    var appointment: [String]?
    var name: String
    var startTime: Int
    var endTime: Int
}
