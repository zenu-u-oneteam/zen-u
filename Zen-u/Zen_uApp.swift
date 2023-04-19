//
//  Zen_uApp.swift
//  Zen-u
//
//  Created by Sitanshu Pokalwar on 17/04/23.
//

import SwiftUI

@main
struct Zen_uApp: App {
    var body: some Scene {
        WindowGroup {
            OnBoardingScreen()
            
            ContentView()
        }
    }
    init(){
            for familyName in UIFont.familyNames {
                print(familyName)
                for fontName in UIFont.fontNames(forFamilyName: familyName){
                    print("-----\(fontName)")
                }
            }
        }
}
