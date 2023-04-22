//
//  SplashScreen.swift
//  Zen-u
//
//  Created by Prakhar Singh on 20/04/23.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        
            VStack(alignment: .center) {
                Text("zen-u")
                    .font(.system(size: 128, weight: .black))
                    .foregroundColor(.black)
                    
                Text("ZEN FOR YOU")
                    .font(.system(size: 16, weight: .regular))
                    .kerning(15)
                    .fontWeight(.regular)
            }
        }
    }

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
