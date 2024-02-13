//
//  AppointmentModel.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 04/08/2023.
//

import Foundation

struct CreateAppointment{
    let name:String
    let email:String
    let date:String
    let reason:String
    let professionalname: String
    let professionaltitle: String
    let professionalimage: String
}

struct Appointment:Codable, Identifiable{
    let name:String
    let email:String
    let date:String
    let reason:String
    let id:String
    let userid:String
    let professionalname: String
    let professionaltitle: String
    let professionalimage: String
}


