//
//  CircleImage.swift
//  Zen-u
//
//  Created by Inzamam on 04/05/23.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
         Image("covid19Center")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
                
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
