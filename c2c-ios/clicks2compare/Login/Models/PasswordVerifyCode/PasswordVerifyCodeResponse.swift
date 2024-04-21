//
//  PasswordVerifyCodeResponse.swift
//  clicks2compare
//
//  Created by Nitin Singh on 16/12/23.
//

import Foundation




struct PasswordVerifyCodeResponse: Codable {
    let code: Int
    let status: String
    let message: MessageType
    let data: TokenData?
    
    struct MessageType: Codable {
        let success: [String]?
        let error: [String]?
    }
    
    struct TokenData: Codable {
        let token: String
        let email: String
    }
    
    enum CodingKeys: String, CodingKey {
        case code
        case status
        case message
        case data
    }
}
