//
//  PasswordEmailRequest.swift
//  clicks2compare
//
//  Created by Nitin Singh on 16/12/23.
//

import Foundation



struct PasswordEmailRequest: Codable {
    let value: String
    let type: String // Assuming type can be "email" or other values
    
    enum CodingKeys: String, CodingKey {
        case value
        case type
    }
}
