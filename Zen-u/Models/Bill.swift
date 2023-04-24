//
//  Bill.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 21/04/23.
//

import Foundation

struct Bill: Hashable, Codable, Identifiable {
    var id: Int
    var timestamp: DateComponents
    var appointmentId: Int
    var amount: Float
    var status: Bool
}
