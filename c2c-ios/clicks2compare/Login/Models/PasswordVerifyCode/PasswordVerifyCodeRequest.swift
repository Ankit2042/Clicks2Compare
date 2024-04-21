//
//  PasswordVerifyCodeRequest.swift
//  clicks2compare
//
//  Created by Nitin Singh on 16/12/23.
//

import Foundation


struct PasswordVerifyCodeRequest: Codable {
    let email: String
    let code: String
    
    enum CodingKeys: String, CodingKey {
        case email
        case code
    }
}
