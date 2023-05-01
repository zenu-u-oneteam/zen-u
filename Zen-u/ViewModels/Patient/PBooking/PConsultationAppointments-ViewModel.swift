//
//  PConsultationAppointments-ViewModel.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 01/05/23.
//

import Foundation

extension PConsultationAppointments {
    @MainActor class ViewModel: ObservableObject {
        @Published var symtomText: String = ""
        @Published var showModel: Bool = false
        @Published var selectedConsltType: ConsltType = ConsltType.general
        @Published var isDeptSelected: Bool = false
        @Published var selectedDeptText: String = "none"
        @Published var isSelected: Bool = false
        
        func slotSelection() {
            isSelected = true
        }
    }
}
