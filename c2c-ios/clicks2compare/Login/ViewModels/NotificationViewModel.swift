//
//  NotificationViewModel.swift
//  clicks2compare
//
//  Created by user257152 on 2/7/24.
//

import Foundation


class NotificationViewModel : ObservableObject {
    
    @Published var notification : NotificationResponse?
    @Published var isProgressView: Bool = false
   
    let notificationAction  = NotificationAction()
    
    init(){
        self.GetNotification()
    }

    func GetNotification() {
        self.isProgressView = true
        notificationAction.GetNotification { response in
            
            DispatchQueue.main.async {
                self.notification = response
                
                self.isProgressView = false
            }
        }
    }
    
}
