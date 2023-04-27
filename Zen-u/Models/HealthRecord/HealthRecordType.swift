//
//  HealthRecordType.swift
//  Zen-u
//
//  Created by Aindrila Ray on 26/04/23.
//

import Foundation
struct HealthRecordType: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var category: HealthCategory
    var image: String
    var description: String

}
