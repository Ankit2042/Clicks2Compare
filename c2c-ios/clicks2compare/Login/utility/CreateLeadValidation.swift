//
//  CreateLeadValidation.swift
//  clicks2compare
//
//  Created by Nitin Singh on 04/01/24.
//

import Foundation

struct ValidCreateLead {
    var success: Bool = false
    var errorMessage: String?
}

struct CreateLeadValidation {
    let error = Error()
    
    func ValidLeadInput(customerName: String, email: String, customerPhoneNo: String) -> ValidCreateLead {
        
        if(customerName.isEmpty){
            return ValidCreateLead(success: false, errorMessage: "Customer Name Empty")
        }
        
        if(email.isEmpty){
            return ValidCreateLead(success: false, errorMessage: "Email Id Empty")
        }
        
        if(isValidEmail(email) == false){
            return ValidCreateLead(success: false, errorMessage: "Invalid Email")
        }
        
        if(customerPhoneNo.isEmpty){
            return ValidCreateLead(success: false, errorMessage: "Customer Phone Empty")
        }
        
        
        return ValidCreateLead(success: true, errorMessage: nil)
    }
    
    
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

}

