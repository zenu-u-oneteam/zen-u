//
//  Vaccination.swift
//  Zen-u
//
//  Created by Inzamam on 26/04/23.
//

import Foundation

struct Vaccination: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var healthcareProvider: String
    var serialNumber: String
    var type: [String]
    var sideEffects: String
    var vaccineDescription: String
}
