//
//  ChangePasswordResponse.swift
//  clicks2compare
//
//  Created by Nitin Singh on 28/12/23.
//

import Foundation

struct ChangePasswordResponse: Codable {
    let code: Int
    let status: String
    let message: MyMessage
}

struct MyMessage: Codable {
    let error: [String]?
    let success: [String]?
    
}
