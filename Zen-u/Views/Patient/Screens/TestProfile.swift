//
//  TestProfile.swift
//  Zen-u
//
//  Created by Aindrila Ray on 27/04/23.
//

import SwiftUI



struct TestProfile: View {
    @State private var name = ""
        @State private var age = ""
        @State private var isEditing = false
    var body: some View {
        VStack {
                    TextField("Name", text: $name)
                        .disabled(!isEditing)
                    TextField("Age", text: $age)
                        .keyboardType(.numberPad)
                        .disabled(!isEditing)
                    
                    Button(action: {
                        isEditing.toggle()
                    }) {
                        if isEditing {
                            Text("Done")
                        } else {
                            Text("Edit")
                        }
                    }
                }
            }

    }


struct TestProfile_Previews: PreviewProvider {
    static var previews: some View {
        TestProfile()
    }
}
