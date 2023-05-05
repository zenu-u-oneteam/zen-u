//
//  User.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 20/04/23.
//

import Foundation

struct User: Hashable, Codable, Identifiable {
    var id: String?
    var name: String
    var email: String
    var userType: UserType
    var profileImage: String
    var mobileNumber: String
}

enum UserType: String, CaseIterable, Codable {
    case patient = "Patient"
    case doctor = "Doctor"
    case admin = "Admin"
    case none = "None"
}

struct UserRaw: Hashable, Codable, Identifiable {
    var id: String?
    var name: String
    var email: String
    var userType: String
    var profileImage: String
    var mobileNumber: String
}
