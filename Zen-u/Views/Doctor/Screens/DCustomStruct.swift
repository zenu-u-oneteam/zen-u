//
//  DCustomStruct.swift
//  Zen-u
//
//  Created by Tanvi Gupta on 28/04/23.
//

import Foundation
import SwiftUI

class DocAppointment : ObservableObject {
    var time : String = ""
    var patient : Docpatient
    var patientType : PatientType
    var docAppointmentType : DocAppType
    
    
    enum DocAppType: String, CaseIterable, Codable {
        case opd = "OPD"
        case operation = "Operations"
        case meeting = "Meetings"
    }
    enum PatientType : String, CaseIterable, Codable {
        case new = "New Patient"
        case follow = "Follow UP"
       
    }
    
    
    
    init(time: String, patient: Docpatient, patientType: PatientType, docAppointmentType: DocAppType) {
        self.time = time
        self.patient = patient
        self.patientType = patientType
        self.docAppointmentType = docAppointmentType
       
    }
}

struct Docpatient{
    var id: Int
    var age: Int
    var gender: Gender
    var bloodGroup: String
    var height: Float
    var weight: Float
    var name : String
    
    enum Gender: String, CaseIterable, Codable {
        case male = "Male"
        case female = "Female"
        case others = "Others"
    }
    
    enum BloodGroup: String, CaseIterable, Codable {
        case APositive = "A+"
        case ANegative = "A-"
        case BPositive = "B+"
        case BNegative = "B-"
        case ABPositive = "AB+"
        case ABNegative = "AB-"
        case OPositive = "O+"
        case ONegative = "O-"
    }
}

class CustomDocData : ObservableObject {
    @State var refresh: Bool = false
    func update() {
        refresh.toggle()
     }
    var appointmentList = [
        DocAppointment(
            time: "12:30",
            patient: Docpatient(id: 175, age: 20 , gender: Docpatient.Gender.female, bloodGroup: Docpatient.BloodGroup.APositive.rawValue, height: 150, weight: 55 , name: "Tanvi Gupta"),
            patientType: DocAppointment.PatientType.new ,
            docAppointmentType: DocAppointment.DocAppType.opd),
        DocAppointment(
            time: "13:30",
            patient: Docpatient(id: 1, age: 25, gender: .male, bloodGroup: "A+", height: 5.8, weight: 65, name: "John Gupta"),
            patientType: DocAppointment.PatientType.follow ,
            docAppointmentType: DocAppointment.DocAppType.operation),
        DocAppointment(
            time: "14:30",
            patient:  Docpatient(id: 2, age: 32, gender: .female, bloodGroup: "B+", height: 5.4, weight: 58, name: "Emma Gupta"),
            patientType: DocAppointment.PatientType.new ,
            docAppointmentType: DocAppointment.DocAppType.meeting),
        DocAppointment(
            time: "15:30",
            patient: Docpatient(id: 3, age: 45, gender: .male, bloodGroup: "O+", height: 6.0, weight: 75, name: "Mike Gupta"),
            patientType: DocAppointment.PatientType.follow ,
            docAppointmentType: DocAppointment.DocAppType.opd),
        DocAppointment(
            time: "16:30",
            patient: Docpatient(id: 4, age: 19, gender: .others, bloodGroup: "AB+", height: 5.6, weight: 60, name: "Alex Gupta"),
            patientType: DocAppointment.PatientType.new ,
            docAppointmentType: DocAppointment.DocAppType.operation),
        DocAppointment(
            time: "17:30",
            patient: Docpatient(id: 5, age: 28, gender: .male, bloodGroup: "A-", height: 5.9, weight: 70, name: "David Gupta"),
            patientType: DocAppointment.PatientType.follow ,
            docAppointmentType: DocAppointment.DocAppType.meeting),
        DocAppointment(
            time: "18:30",
            patient:  Docpatient(id: 6, age: 30, gender: .female, bloodGroup: "B-", height: 5.5, weight: 55, name: "Sophie Gupta"),
            patientType: DocAppointment.PatientType.new ,
            docAppointmentType: DocAppointment.DocAppType.opd),
        DocAppointment(
            time: "19:30",
            patient: Docpatient(id: 7, age: 50, gender: .male, bloodGroup: "O-", height: 5.11, weight: 80, name: "Robert Gupta"),
            patientType: DocAppointment.PatientType.follow ,
            docAppointmentType: DocAppointment.DocAppType.operation),
        DocAppointment(
            time: "20:30",
            patient: Docpatient(id: 8, age: 22, gender: .others, bloodGroup: "AB-", height: 5.7, weight: 62, name: "Alice Gupta"),
            patientType: DocAppointment.PatientType.new ,
            docAppointmentType: DocAppointment.DocAppType.meeting),
        
    ]

}
