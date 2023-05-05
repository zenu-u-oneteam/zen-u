//
//  Alert.swift
//  Zen-u
//
//  Created by Tanvi Gupta on 04/05/23.
//

import Foundation

struct AlertModelMy: Hashable , Codable , Identifiable{
    var id : String?
    var code: String
    var datetime: Date
    var description: String
    var isResolved: Bool
}

struct AlertRaw: Hashable , Codable , Identifiable {
    var id : String?
    var code: String
    var datetime: Int
    var description: String
    var isResolved: Bool
}
