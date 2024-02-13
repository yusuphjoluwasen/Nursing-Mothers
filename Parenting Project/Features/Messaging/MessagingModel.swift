//
//  Messagingroom.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 26/07/2023.
//

import Foundation
import Firebase

struct MessagingRoom:Codable, Identifiable{
    var id:String
    var name: String
}

struct Message:Codable, Identifiable{
    var id:String
    let item:String
    let time: Timestamp
    let roomid:String
    let username:String
    let userid:String
}

struct CreateMessage:Codable{
    let item:String
    let roomid:String
    let username:String
}




