//
//  NotificationViewModel.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 01/08/2023.
//

import Foundation
import Combine

class NotificationViewModel:ObservableObject{
    
    @Published var notificationlist:[NotificationItem] = []
    
    init(){
       notificationlist = createNotification()
    }
    
    private func createNotification() -> [NotificationItem]{
        return [
            NotificationItem(quote: "Is baby latching on well, is your wife experiencing pain when breastfeeding"),
            NotificationItem(quote: "Is baby latching on well, is your wife experiencing pain when breastfeeding")
        ]
    }
    
}
