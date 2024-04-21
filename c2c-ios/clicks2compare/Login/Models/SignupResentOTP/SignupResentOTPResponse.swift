//
//  SignupResentOTPResponse.swift
//  clicks2compare
//
//  Created by user257152 on 2/16/24.
//

import Foundation


struct SignupResentOTPResponse: Codable{
    let code: Int
       let status: String
//       let message: ErrorMessage
}


struct OTPMessage: Codable {
    let success: [String]?
    let error: [String]?
}
