//
//  PasswordEmailResponse.swift
//  clicks2compare
//
//  Created by Nitin Singh on 16/12/23.
//

import Foundation


struct PasswordEmailResponse: Codable {
    let code: Int
    let status: String
    let message: Message
    let data: EmailData?

    struct Message: Codable {
        let error: [String]?
        let success: [String]?

    }

    struct EmailData: Codable {
        let email: String?
    }

   
}


