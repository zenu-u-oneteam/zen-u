//
//  HealthKitView.swift
//  Zen-u
//
//  Created by Aindrila Ray on 23/04/23.
//

import SwiftUI

struct HealthKitView: View {
    var body: some View {
        VStack(spacing: 18) {
            Text("72 bpm")
                .font(.subheadline.bold())
            
            Image(systemName: "waveform.path.ecg")
                .resizable()
                .frame(width: 65, height: 65)
            
            Text("Heart Rate")
                .font(.subheadline.bold())
        }
        .padding()
        .foregroundColor(Color.white)
        .frame(width: 158, height: 151)
        .background(Color("AccentColor"))
        .cornerRadius(18)
    }
}

struct HealthKitView_Previews: PreviewProvider {
    static var previews: some View {
        HealthKitView()
    }
}
