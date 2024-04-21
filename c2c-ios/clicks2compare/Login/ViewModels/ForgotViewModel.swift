//
//  ForgotViewModel.swift
//  clicks2compare
//
//  Created by Nitin Singh on 15/12/23.
//

import Foundation
import SwiftUI


class ForgotViewModel : ObservableObject {
    
    
    @Published var password: String = ""
    @Published var passwordconfirmation: String = ""
    @Published var email: String = ""
    @Published var token: String = ""
    @Published var isLoading: Bool = false
    @Published var message : String = ""
    @Published var isPresentingErrorAlert: Bool = false
    @Published var navigate: Bool = false
    @Published var issuccess: Bool = false
    @Published var isProgressView: Bool = false
    
    
    private let createPasswordValidation = CreatePasswordValidation()
    
    
    func ValidInput() -> Bool {
        let result = createPasswordValidation.CreatePasswordInput(password: password, canfrimPassword: passwordconfirmation)
        
        if (result.success == false) {
            message = result.errorMessage ?? "error occured"
            isPresentingErrorAlert = true
            return false
        }
        
        return true
    }
    
    func Forgot(){
        self.isProgressView = true
        let forgotPasswordAction = ForgotAction(parameters: ForgotRequest(email: email, password: password, passwordconfirmation: passwordconfirmation, token: token))
        
        forgotPasswordAction.ForgotPassword{response in
            let errormessage = response.message.error?.joined(separator: " , ") ?? ""
            let successmessage = response.message.success?.joined(separator: " , ") ?? ""
            
            DispatchQueue.main.async {
                if (response.status == "ok"){
                    self.issuccess = true
                    self.message = successmessage
                    self.isPresentingErrorAlert = true
                    self.isProgressView = false
                }else if (response.status == "error"){
                    self.message = errormessage
                    self.isPresentingErrorAlert = true
                    self.isProgressView = false
                }
            }
            
            
        }
    }
    
}
