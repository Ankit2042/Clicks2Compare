//
//  ForgotResponse.swift
//  clicks2compare
//
//  Created by Nitin Singh on 15/12/23.
//

import Foundation



struct ForgotResponce: Codable {
    let code: Int
    let status: String
    let message: Message
    
    struct Message: Codable {
        let error: [String]?
        let success: [String]?
    }
    
    enum CodingKeys: String, CodingKey {
        case code
        case status
        case message
    }
}
