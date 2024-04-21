//
//  PasswordEmailViewModel.swift
//  clicks2compare
//
//  Created by Nitin Singh on 16/12/23.
//

import Foundation
import SwiftUI



class PasswordEmailViewModel: ObservableObject{
    
    @Published var value: String = ""
    @Published var type: String = "email"
    @Published var SendOTP: Bool = false
    @Published var message : String = ""
    @Published var isPresentingErrorAlert: Bool = false
    @Published var issuccess: Bool = false
    @Published var isProgressView: Bool = false
    private var forgotValidation = ForgotValidation()
    
    func ValidInput() -> Bool {
        let result = forgotValidation.ForgotInput(email: value)
        if(result.success == false){
            message = result.errorMessage ?? "error occured"
            isPresentingErrorAlert = true
            return false
        }
        
        return true
    }
    
    
    
    func PasswordEmail(){
        self.isProgressView = true
       let passwordEmailAction = PasswordEmailAction(parameters: PasswordEmailRequest(value: value, type: type))
        
        passwordEmailAction.SendPasswordEmail{response in
            let errormessage = response.message.error?.joined(separator: " , ") ?? ""
            let successmessage = response.message.success?.joined(separator: " , ") ?? ""
            DispatchQueue.main.async {
                if(response.status == "ok"){
                    self.SendOTP = true
                    self.issuccess = true
                    self.isProgressView = false
                    self.message = successmessage
//                    self.isPresentingErrorAlert = true
                }else if(response.status == "invalidemail") {
                    self.message = errormessage
                    self.isPresentingErrorAlert = true
                    self.isProgressView = false
                }else if(response.status == "usernotfound"){
                    self.message = errormessage
                    self.isPresentingErrorAlert = true
                    self.isProgressView = false
                }
            }
            
        }
        
    }
    
}



