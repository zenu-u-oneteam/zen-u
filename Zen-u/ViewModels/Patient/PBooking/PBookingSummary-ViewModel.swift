//
//  PBookingSummary-ViewModel.swift
//  Zen-u
//
//  Created by Vashist Agarwalla on 02/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

extension PBookingSummary {
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
        @Published var hasPaied = false
        private let reason: String
        private let department: DepartmentRaw
        private let appointmentType: AppointmentTypeRaw
        private let selectedSlot: Date
        private let allotedDoctor: String
        
        let db = FirebaseConfig().db

        init(reason: String, department: DepartmentRaw, appointmentType: AppointmentTypeRaw, selectedSlot: Date, allotedDoctor: String) {
            self.reason = reason
            self.appointmentType = appointmentType
            self.department = department
            self.selectedSlot = selectedSlot
            self.allotedDoctor = allotedDoctor
        }
        
        func makePayment() async {
            do {
                isLoading = true
                print(allotedDoctor)
                let billId = makeid(length: 35)
                let bill = BillRaw(
                    timestamp: Int(Date().timeIntervalSince1970),
                    amount: appointmentType.amount,
                    status: true
                )
                try db.collection("Bill").document(billId).setData(from: bill)
                print(billId)

                let appointmentId = makeid(length: 15)
                print(appointmentId)
                let currentUserId = Auth.auth().currentUser!.uid
                let appointment: AppointmentRaw = AppointmentRaw(
                    appointmentTime: Int(selectedSlot.timeIntervalSince1970),
                    patient: currentUserId,
                    doctor: allotedDoctor,
                    type: appointmentType.id!,
                    bill: billId
                )
                try db.collection("Appointment").document(appointmentId).setData(from: appointment)
                print(appointment)
                
                try await db.collection("Doctor").document(allotedDoctor).updateData(["appointments": FieldValue.arrayUnion([appointmentId])])
                
                try await db.collection("Patient").document(currentUserId).updateData(["appointments": FieldValue.arrayUnion([appointmentId])])

                isLoading = false
                hasPaied = true

            } catch {
                print(error)
            }
        }
    }
}
