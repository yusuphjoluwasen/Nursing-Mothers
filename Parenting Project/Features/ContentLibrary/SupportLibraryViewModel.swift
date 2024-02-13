//
//  SupportLibraryViewModel.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 04/08/2023.
//

import Foundation
import Combine

class SupportLibraryViewModel:ObservableObject{
    
    @Published var supportlibrarylist:[SupportLibrary] = []
    @Published var search = ""
    
    init(){
       supportlibrarylist = createContentLibrary()
    }
    
    private func createContentLibrary() -> [SupportLibrary]{
        return [
            SupportLibrary(resource: "BreastFeeding", info: "Congratulations on becoming a new nursing mother! Breastfeeding is a wonderful and rewarding experience"),
            SupportLibrary(resource: "Formula Feeding",info: "Congratulations on becoming a new nursing mother! Breastfeeding is a wonderful and rewarding experience"),
            SupportLibrary(resource: "New Born Screening",info: "Congratulations on becoming a new nursing mother! Breastfeeding is a wonderful and rewarding experience"),
            SupportLibrary(resource: "Immunization", info: "Congratulations on becoming a new nursing mother! Breastfeeding is a wonderful and rewarding experience"),
        ]
    }
    
    func searchForALibrary(){
        let libraries:[SupportLibrary] = createContentLibrary()
        if search == ""{
            supportlibrarylist = libraries
        }else{
            let filtered = libraries.filter { item in item.resource.lowercased().contains(search.lowercased())}
            supportlibrarylist = filtered
        }
    }
    
}

