//
//  Helpers.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 03/05/23.
//

import Foundation

func extractDate(date: Date, format: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    return formatter.string(from: date)
}

func extractDate(timeStamp: Int, format: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    return formatter.string(from: Date(timeIntervalSince1970: TimeInterval(timeStamp)))
}

func makeid(length: Int) -> String {
    let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let allowedCharsCount = UInt32(allowedChars.count)
    var randomString = ""

    for _ in 0 ..< length {
        let randomNum = Int(arc4random_uniform(allowedCharsCount))
        let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)
        let newChar = allowedChars[randomIndex]
        randomString += String(newChar)
    }

    return randomString
}
