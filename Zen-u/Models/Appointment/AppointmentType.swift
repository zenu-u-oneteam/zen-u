//
//  AppointmentType.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 21/04/23.
//

import Foundation

struct AppointmentType: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var amount: Float
    var category: Category
    var department: Department
    
    enum Category: String, CaseIterable, Codable {
        case consultation = "Consultation"
        case lab = "Lab"
        case vaccination = "Vaccination"
    }
}
