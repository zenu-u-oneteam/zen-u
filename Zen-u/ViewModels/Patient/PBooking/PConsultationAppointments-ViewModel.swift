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
        var department: DepartmentRaw
        var appointmentType: AppointmentTypeRaw
        
        let db = FirebaseConfig().db

        init() {
            department = DepartmentRaw()
            appointmentType = AppointmentTypeRaw(name: "", amount: 0.0, category: "", department: "")
            Task {
                await getDepartmentDetails("tv2znSbmMj")
            }
        }
        
        func getDepartmentDetails(_ departmentID: String) async {
            do {
                var departmentDetails = try await db.collection("Department").document(departmentID).getDocument(as: DepartmentRaw.self)
                departmentDetails.pastAppointments = nil
                departmentDetails.id = departmentID
                department = departmentDetails
                
                var appointmentTypeDetails = try await db.collection("AppointmentType").document(departmentDetails.appointmentType![0]).getDocument(as: AppointmentTypeRaw.self)
                appointmentTypeDetails.id = departmentDetails.appointmentType![0]
                appointmentType = appointmentTypeDetails
            } catch {
                fatalError("\(error)")
            }
        }
        
        func slotSelection() {
            isSelected = true
        }
    }
}
