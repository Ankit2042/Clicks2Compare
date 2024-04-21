//
//  OTPVerifyResponse.swift
//  clicks2compare
//
//  Created by Nitin Singh on 12/12/23.
//

import Foundation


struct VerifyResponse: Codable {
    let code: Int
    let status: String
    let message: SuccessMessage
    let data: UserData?
}

struct SuccessMessage: Codable {
    let error: [String]?
    let success: [String]?
}

//struct SuccessResponse: Codable {
//    let code: Int
//    let status: String
//    let message: SuccessMessage
//    let data: UserData?
//}

//struct SuccessMessage: Codable {
//    let success: [String]
//}
//
struct UserData: Codable {
    let access_token: String
    let user: User
    let token_type: String
}

struct User: Codable {
    let id: Int
    let name: String
    let email: String
    // Add other user properties as needed
}
