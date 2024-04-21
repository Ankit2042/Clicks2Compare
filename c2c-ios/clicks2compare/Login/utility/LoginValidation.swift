//
//  LoginValidation.swift
//  clicks2compare
//
//  Created by Nitin Singh on 25/12/23.
//

import Foundation


struct ValidationResult {
    var success: Bool = false
    var errorMessage: String?
}


struct LoginValidation {
    let error = Error()
    
    func validateUserInputs(email: String , password: String) -> ValidationResult {
        
        if(email.isEmpty || password.isEmpty){
            return ValidationResult(success: false, errorMessage: error.empty)
        }
        
        if(isValidEmail(email) == false){
            return ValidationResult(success: false, errorMessage: error.invalid)
        }
        
        if(isValidPassword(password) == false){
            return ValidationResult(success: false, errorMessage: error.invalid)
        }
        
        return ValidationResult(success: true, errorMessage: nil)
    }
    
    
    // Validate the email id
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    
    // Validate the Password
    private func isValidPassword(_ password: String) -> Bool {
        // Add your password validation logic here
        return password.count >= 6 // Example: Minimum 6 characters
    }
}
