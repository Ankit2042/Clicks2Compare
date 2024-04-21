//
//  PasswordVerifyCodeViewModel.swift
//  clicks2compare
//
//  Created by Nitin Singh on 16/12/23.
//

import Foundation


class PasswordVerifyCodeViewModel: ObservableObject{
    @Published var ForgotPas: Bool = false
    @Published var email: String = ""
    @Published var code: String = ""
    @Published var message : String = ""
    @Published var isPresentingErrorAlert: Bool = false
    @Published var isProgressView: Bool = false
    
    
    
    func VerifyCode(){
        self.isProgressView = true
        let passwordVerifyCode = PasswordVerifyCodeAction(parameters: PasswordVerifyCodeRequest(email: email, code: code))
        
        passwordVerifyCode.OTPVerifyCode{response in
            
            
            let errormessage = response.message.error?.joined(separator: " , ") ?? ""
//            let successmessage = response.message.success?.joined(separator: " , ") ?? ""
            
            DispatchQueue.main.async {
                if (response.status == "ok"){
                    self.ForgotPas = true
                    self.isProgressView = false
                }else if (response.status == "requiredotp"){
                    self.message = errormessage
                    print(self.message)
                    self.isPresentingErrorAlert = true
                    self.isProgressView = false
                }else if (response.status == "invalidtoken"){
                    print(self.message)
                    self.message = errormessage
                    self.isPresentingErrorAlert = true
                    self.isProgressView = false
                }
            }
            
        }
    }
}
