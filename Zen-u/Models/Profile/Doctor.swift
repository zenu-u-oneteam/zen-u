//
//  Doctor.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 21/04/23.
//

import Foundation

struct Doctor: Hashable, Codable, Identifiable {
    var id: Int
    var age: Int
    var gender: Gender
    var department : Department
    
    enum Gender: String, CaseIterable, Codable {
        case male = "Male"
        case female = "Female"
        case others = "Others"
    }
    
}
