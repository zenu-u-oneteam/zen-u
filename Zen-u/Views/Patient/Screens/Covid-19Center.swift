//
//  Covid-19Center.swift
//  Zen-u
//
//  Created by Inzamam on 04/05/23.
//

import SwiftUI

struct Covid_19Center: View {
    var body: some View {
        VStack {
            MapView()
                //.ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            HStack {
                VStack (alignment: .leading){
                    Text("SKS Clinic")
                        .font(.title)
                    Text("Guduvanchery, Chengalpattu")
                }
                Spacer()
                
                VStack {
                    Text("8am - 7pm")
                        .font( .title3.bold())
                }
            }
            .padding(16)
            Spacer()
        }
    }
}

struct Covid_19Center_Previews: PreviewProvider {
    static var previews: some View {
        Covid_19Center()
    }
}
