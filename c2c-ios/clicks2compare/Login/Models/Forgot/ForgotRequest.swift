//
//  ForgotRequest.swift
//  clicks2compare
//
//  Created by Nitin Singh on 15/12/23.
//

import Foundation



struct ForgotRequest: Codable {
    let email: String
    let password: String
    let passwordconfirmation: String
    let token: String // Assuming token is a number
    
    enum CodingKeys: String, CodingKey {
        case email
        case password
        case passwordconfirmation = "password_confirmation"
        case token
    }
}
