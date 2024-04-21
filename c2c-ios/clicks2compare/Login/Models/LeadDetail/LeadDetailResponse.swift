//
//  LeadDetailResponse.swift
//  clicks2compare
//
//  Created by Nitin Singh on 11/01/24.
//

import Foundation


import Foundation

struct LeadDetailResponse: Codable {
    let code: Int
    let status: String
    let message: LeadDetailMessage
    let data: LeadDetailData
}

struct LeadDetailMessage: Codable {
    let success: [String]?
    let error: [String]?
}

struct LeadDetailData: Codable {
    let leadDetail: LeadcustomerDetail
    let leadStages: LeadStages

    enum CodingKeys: String, CodingKey {
        case leadDetail = "lead_detail"
        case leadStages = "lead_stages"
    }
}

struct LeadcustomerDetail: Codable {
    let id: Int
    let n1: String?
    let departmentID: Int?
    let email: String?
    let customerName: String?
    let phone: String?
    let comment: String?
    let leadGiveBy: String?
    let incomeOpportunity: String?
    let currentStage: String?
    let escalationName: String?
    let escalationEmail: String?
    let escalationMobile: String?
    let teamLeaderName: String?
    let teamLeaderEmail: String?
    let teamLeaderMobile: String?
    
    enum CodingKeys: String, CodingKey {
        case id, n1
        case departmentID = "department_id"
        case email, customerName = "Customer_name", phone, comment
        case leadGiveBy = "lead_give_by"
        case incomeOpportunity = "income_opportunity"
        case currentStage = "current_stage"
        case escalationName = "escalation_name"
        case escalationEmail = "escalation_email"
        case escalationMobile = "escalation_mobile"
        case teamLeaderName = "team_leader_name"
        case teamLeaderEmail = "team_leader_email"
        case teamLeaderMobile = "team_leader_mobile"
    }
}

struct LeadStages: Codable {
    let name: [String]
    let status: [String]
}








//struct LeadDetailResponse: Codable {
//    let code: Int
//    let status: String?
//    let message: LeadDetailMessage
//    let data: LeadDataModel
//}
//
//
//struct LeadDetailMessage: Codable {
//    let success: [String]?
//    
//}
//
//
//struct LeadDataModel: Codable {
//    let totalLeads: Int
//    let totalInprogress: Int
//    let totalConverted: Int
//    let totalSubmitted: Int
//    let totalRejected: Int
//    let leadDetail: UserLeadDetail
//
//    enum CodingKeys: String , CodingKey {
//        case totalLeads = "total_leads"
//        case totalInprogress = "total_inprogress"
//        case totalConverted = "total_converted"
//        case totalSubmitted = "total_submitted"
//        case totalRejected = "total_rejected"
//        case leadDetail = "lead_detail"
//    }
//
//}
//
//struct UserLeadDetail: Codable {
//    let id: Int
//    let n1: String
//    let email: String
//    let customerName: String
//    let phone: String
//    let paymentMode: String?
//    let comment: String?
//    let leadStatus: String?
//
//    enum CodingKeys: String , CodingKey {
//        case id
//        case n1, email, phone , comment, paymentMode
//        case customerName = "Customer_name"
//        case leadStatus = "lead_status"
//    }
//    
//}
