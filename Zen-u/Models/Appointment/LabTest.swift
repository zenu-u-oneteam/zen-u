//
//  LabTest.swift
//  Zen-u
//
//  Created by Prakhar Singh on 26/04/23.
//

import Foundation

import Foundation

struct LabTest: Hashable, Codable, Identifiable {
    var id: Int
    var appointment: Appointment
    var type: String
    var package: String
    var organs: String
}
