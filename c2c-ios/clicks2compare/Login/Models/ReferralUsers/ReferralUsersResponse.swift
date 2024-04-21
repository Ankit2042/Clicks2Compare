//
//  ReferralUsersResponse.swift
//  clicks2compare
//
//  Created by Nitin Singh on 05/01/24.
//

import Foundation



struct ReferralUsersResponse: Codable {
    let code: Int?
    let status: String?
    let message: ReferralMessage
    let data: DataModel
}

struct ReferralMessage: Codable {
    let success: [String]?
    let error: [String]?
}

struct DataModel: Codable {
    let totalLeads: String?
    let totalInprogress: String
    let totalConverted: String
    let totalSubmitted: String
    let totalRejected: String
    let referralUsers: [ReferralUser]
    
    let piegraph: Piegraph
    
    enum CodingKeys: String , CodingKey {
        case totalLeads = "total_leads"
        case totalInprogress = "total_inprogress"
        case totalConverted = "total_converted"
        case totalSubmitted = "total_submitted"
        case totalRejected = "total_rejected"
        case referralUsers = "referral_users"
        
        case piegraph
    }
}

struct Piegraph: Codable{
    
    let name: [String]?
    let value : [String]?
}


struct ReferralUser: Codable, Hashable {
    let id: Int?
    let n1: String?
    let departmentId: Int?
    let email: String?
    let customerName: String?
    let phone: String?
    let incomeOpportunity: String?
    let currentStage: String?
    let leadStage: String?
    // Add other properties you need from the response
    
    
    enum CodingKeys: String , CodingKey {
        case id, n1, email, phone
        case departmentId = "department_id"
        case customerName = "Customer_name"
        case incomeOpportunity = "income_opportunity"
        case currentStage = "current_stage"
        case leadStage = "lead_stage"
    }
}
