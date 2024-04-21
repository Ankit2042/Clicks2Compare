//
//  SingUpValidation.swift
//  clicks2compare
//
//  Created by user257152 on 1/31/24.
//

import Foundation


struct SingUpValidation {
    let error = Error()
    
//    @Published var OTPverify: Bool = false
//    @Published var name: String = ""
//    @Published var email: String = ""
//    @Published var password: String = ""
//    @Published var refralphone: String = ""
//    @Published var recommendedby: String = ""
    
    func SingUpInput(name: String, email: String, password: String, refralphone: String, recommendedby: String ) -> ValidCreateLead {
        
        if(name.isEmpty){
            return ValidCreateLead(success: false, errorMessage: "Name Empty")
        }
        
        if(email.isEmpty){
            return ValidCreateLead(success: false, errorMessage: "Email Id Empty")
        }
        
        if(isValidEmail(email) == false){
            return ValidCreateLead(success: false, errorMessage: "Invalid Email")
        }
        
        if(password.isEmpty){
            return ValidCreateLead(success: false, errorMessage: "Please Enter Password")
        }
        
        if(refralphone.isEmpty){
            return ValidCreateLead(success: false, errorMessage: "Phone Number Empty")
        }
        
        if(recommendedby.isEmpty){
            return ValidCreateLead(success: false, errorMessage: "Please Select Recommended By")
        }
        
        if(recommendedby == "Select Option"){
            return ValidCreateLead(success: false, errorMessage: "Please Select Recommended By")
        }
        
        
        return ValidCreateLead(success: true, errorMessage: nil)
    }
    
    
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

}
