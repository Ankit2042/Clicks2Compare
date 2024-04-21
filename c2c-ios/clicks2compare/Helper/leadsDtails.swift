import Foundation

struct YourResponseModel: Codable {
    let data: YourDataModel
}

struct YourDataModel: Codable {
    let leadDetail: LeadDetails
    let loanDetails: LoanDetails
    let task: Task
    let teamLeader: TeamLeader
    let escalation: Escalation
    
    
    enum CodingKeys: String, CodingKey {
        case leadDetail = "lead_detail"
        case loanDetails = "loan_details"
        case task
        case teamLeader = "team_leader"
        case escalation
    }
}

struct LeadDetails: Codable {
    let id: Int
    let email: String
    let customerName: String
    let phone: String
    let comment: String
    let n1: String
    enum CodingKeys: String, CodingKey {
        case id, email, n1
        case customerName = "Customer_name"
        case phone, comment
    }
}

struct LoanDetails: Codable {
    let loanAmount: String?
    let approvedByBank: String?
    let incomeOpportunity: String?

    enum CodingKeys: String, CodingKey {
        case loanAmount = "loan_amount"
        case approvedByBank = "approved_By_Bank"
        case incomeOpportunity = "income Opportunity"
    }
}

struct Task: Codable {
    let taskCoordinator: String?
    let email: String?
    let mobile: String?
    
    
    enum CodingKeys: String, CodingKey {
        case taskCoordinator = "task_Coordinator"
        case email, mobile
        
    }
}

struct TeamLeader: Codable {
    let teamLeader: String?
    let email: String?
    let mobile: String?

    enum CodingKeys: String, CodingKey {
        case teamLeader = "team_leader"
        case email, mobile
    }
}

struct Escalation: Codable {
    let escalation: String?
    let email: String?
    let mobile: String?

    enum CodingKeys: String, CodingKey {
        case escalation, email, mobile
    }
}

