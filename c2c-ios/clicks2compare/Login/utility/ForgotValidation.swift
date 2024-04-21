//
//  ForgotValidation.swift
//  clicks2compare
//
//  Created by user257152 on 2/3/24.
//

import Foundation



struct ForgotValidation {
    let error = Error()
    
    func ForgotInput(email: String) -> ValidationResult {
        if(email.isEmpty){
            return ValidationResult(success: false, errorMessage: "Email Id Empty")
        }
        
        if(isValidEmail(email) == false){
            return ValidationResult(success: false, errorMessage: "Email Id Invalid")
        }
        
        return ValidationResult(success: true, errorMessage: nil)
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}



struct CreatePasswordValidation {
    
    
    func CreatePasswordInput(password: String, canfrimPassword: String) -> ValidationResult{
        if(password.isEmpty){
            return ValidationResult(success: false, errorMessage: "Please Enter New Password")
        }
        
        if(canfrimPassword.isEmpty){
            return ValidationResult(success: false, errorMessage: "Please Enter canfrim New Password")
        }
        
        
        return ValidationResult(success: true, errorMessage: nil)
    }
}
