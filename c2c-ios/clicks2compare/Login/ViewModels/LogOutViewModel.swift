//
//  LogOutViewModel.swift
//  clicks2compare
//
//  Created by Nitin Singh on 28/12/23.
//

import Foundation
import SwiftUI

class LogOutViewModel : ObservableObject {
    @Published var id: Int = 0
    @Published var userProfile: LogOutResponse?
    @Published var Message : String = ""
    @Published var isPresentingErrorAlert: Bool = false
    @Published var navigate: Bool = false
    
    @AppStorage("loginToken") private var loginToken: String = ""
    
    let logOutAction = LogoutAction()
    var helper = Helper()
    func LogOut() {
        logOutAction.LogOut { response in
            let message = response.message.success?.joined(separator: " , ") ?? " "
           
            DispatchQueue.main.async {
                if message == "success"{
                    
                    self.Message  = message
                    self.isPresentingErrorAlert = true
                    self.helper.cleanTokenData()
                    self.loginToken = ""
                }else{
                    self.Message  = message
                    self.isPresentingErrorAlert = true
                    self.helper.cleanTokenData()
//                    self.loginToken = ""
                }
                
               
            }
        }
    }
    
}
