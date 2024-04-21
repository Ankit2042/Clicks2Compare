//
//  VerifyValidation.swift
//  clicks2compare
//
//  Created by user257152 on 1/31/24.
//

import Foundation


struct VerifyValidation {
    let error = Error()
    
    func VerifyInput(code: String) -> ValidCreateLead {
        
        if(code.isEmpty){
            return ValidCreateLead(success: false, errorMessage: "Please Enter Code")
        }
        
        if(code.count < 6){
            return ValidCreateLead(success: false, errorMessage: "Invalid Code")
        }
        
        return ValidCreateLead(success: true, errorMessage: nil)
    }
}


