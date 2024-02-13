//
//  User.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 01/08/2023.
//

import Foundation

struct UserProfile:Codable, Identifiable{
    let id:String
    let name:String
    var jobtitle:String = ""
    let email:String
    var profilepicture:String = ""
    var bio: String = ""
    let usertype: String
}
