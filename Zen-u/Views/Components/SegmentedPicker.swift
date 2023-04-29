//
//  SegmentedPicker.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 23/04/23.
//

import SwiftUI

struct SegmentedPicker: View {
    @Binding var currentIndex: Int
    var selections: [String]
    
    init(_ currentIndex: Binding<Int>, selections: [String]) {
        self._currentIndex = currentIndex
        self.selections = selections
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "AccentColor")!], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "Heading")!], for: .normal)
    }
    
    var body: some View {
        VStack {
            Picker("", selection: $currentIndex) {
                ForEach(selections.indices, id: \.self) { index in
                    Text(selections[index])
                        .tag(index)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}
