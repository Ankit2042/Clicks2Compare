//
//  LogOutResponse.swift
//  clicks2compare
//
//  Created by Nitin Singh on 28/12/23.
//

import Foundation


struct LogOutResponse : Codable {
    let code: Int
    let status: String
    let message: LogOutMessage
    
    
    struct LogOutMessage : Codable {
        let error: [String]?
        let success: [String]?
    }
}
