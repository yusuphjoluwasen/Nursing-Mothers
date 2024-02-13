//
//  Professional.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 26/07/2023.
//

import Foundation

struct Professional: Identifiable{
    var id = UUID()
    var imageName: String
    var profName: String
    var profTitle: String
    var profDesc: String
}

let Professionals: [Professional] = [
      Professional(imageName: "Elizabeth", profName:"Elizabeth Smith", profTitle: "Health Vistor", profDesc: "15 year experience in supporting children and families in the community"),
      Professional(imageName: "Justin", profName:"Dr. Justin Fischback", profTitle: "Communities Paedatrician", profDesc: "Children growth development"),
      Professional(imageName: "Binta", profName:"Binta Nathan", profTitle: "Breadfeeding Specialist", profDesc: "Support with feeding"),
      Professional(imageName: "Bidishia", profName:"Bidishia Ahmed", profTitle: "Breadfeeding Specialist", profDesc: "Support with feeding"),
      Professional(imageName: "Olamide", profName:"Olamide Adeleke", profTitle: "Breadfeeding Specialist", profDesc: "Support with feeding")
     
]
