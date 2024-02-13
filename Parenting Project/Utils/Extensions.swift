//
//  Extensions.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 18/07/2023.
//

import Foundation
import SwiftUI

extension Color{
    static let primaryColor = Color("PrimaryColor")
    static let lightPrimaryColor = Color("LightPrimaryColor")
    static let borderColor = Color("BorderColor")
    static let bgColor = Color("BgColor")
}

extension Date {

    func formattedDate() -> String {

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "EEEE d'th' MMMM, yyyy h:mm a"

        return dateFormatter.string(from: self)

    }

}


//Poppins-Thin
//Poppins-Light
//Poppins-Medium
//Poppins-SemiBold
//Poppins-Bold
//Poppins-Regular
