//
//  Covid-19Center.swift
//  Zen-u
//
//  Created by Inzamam on 03/05/23.
//

import SwiftUI

struct Covid_19Center: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack (alignment: .leading){
                    Text("SKS Clinic")
                        .font(.title)
                HStack {
                    Text("Guduvanchery, Chengalpattu")
                    Spacer()
                    Text("8am-7pm")
                        .font( .subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct Covid_19Center_Previews: PreviewProvider {
    static var previews: some View {
        Covid_19Center()
    }
}
