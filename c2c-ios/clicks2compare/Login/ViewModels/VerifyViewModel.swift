//
//  VerifyViewModel.swift
//  clicks2compare
//
//  Created by Nitin Singh on 12/12/23.
//

import Foundation
import SwiftUI

class VerifyViewModel: ObservableObject {
    
    @Published var refralphone: String = ""
    @Published var email: String = ""
    @Published var code: String = ""
    @Published var message : String = ""
    @Published var isPresentingErrorAlert: Bool = false
    @Published var navigate: Bool = false
    @Published var issuccess: Bool = false
    private let verifyValidation = VerifyValidation()
    
    func VerifyInput() -> Bool{
        let result = verifyValidation.VerifyInput(code: code)
        if(result.success == false){
            message = result.errorMessage ?? "error occured"
            isPresentingErrorAlert = true
            return false
        }
        return true
    }
    
    func Verify() {
        let verifyAction = VerifyAction(parameters: VerifyRequest(email: email, code: code))
        
        verifyAction.OTPVerify{ response in
            let errormessage = response.message.error?.joined(separator: " , ") ?? ""
            let successmessage = response.message.success?.joined(separator: " , ") ?? ""
            DispatchQueue.main.async {
                if(response.status == "created"){
                    self.message = successmessage
                    self.isPresentingErrorAlert = true
                    self.issuccess = true
                }else if(response.status == "invalidcode"){
                    self.message = errormessage
                    self.isPresentingErrorAlert = true
                }
            }
        }
        
    }
    
}

