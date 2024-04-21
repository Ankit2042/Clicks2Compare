//
//  ChangePassword.swift
//  clicks2compare
//
//  Created by Nitin Singh on 28/12/23.
//

import Foundation


struct ChangePasswordRequest: Codable {
    let currentPassword: String
    let password: String
    let passwordConfirmation: String
    
    enum CodingKeys: String, CodingKey{
        case password
        case currentPassword = "current_password"
        case passwordConfirmation = "password_confirmation"
    }
    
}
