//
//  CreateLeadResponse.swift
//  clicks2compare
//
//  Created by Nitin Singh on 04/01/24.
//

import Foundation


struct CreateLeadResponse: Codable {
    let code: Int
    let status: String
    let message: LeadMessage
}

struct LeadMessage: Codable {
    let success: [String]?
    let error: [String]?
}
