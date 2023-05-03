//
//  Bill.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 21/04/23.
//

import Foundation

struct Bill: Hashable, Codable, Identifiable {
    var id: String
    var timestamp: DateComponents
    var amount: Float
    var status: Bool
}
