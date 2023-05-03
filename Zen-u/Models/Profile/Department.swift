//
//  Department.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 21/04/23.
//

import Foundation

struct Department: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var doctors: [String]
    var appointmentType: [String]
    var pastAppointments: [String]?
}

struct DepartmentRaw: Hashable, Codable, Identifiable {
    var id: String?
    var name: String?
    var description: String?
    var doctors: [String]?
    var appointmentType: [String]?
    var pastAppointments: [String]?
}
