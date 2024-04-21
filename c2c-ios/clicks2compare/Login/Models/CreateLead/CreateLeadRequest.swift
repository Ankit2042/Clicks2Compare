//
//  CreateLeadRequest.swift
//  clicks2compare
//
//  Created by Nitin Singh on 04/01/24.
//

import Foundation


struct CreateLeadRequest: Codable {
    let customerName: String
    let customerEmail: String
    let customerPhoneNo: String
    let customerPhoneCode: String
    let leadType: String
    let departmentId: String
    let comment: String?
    
    enum CodingKeys: String, CodingKey{
        case customerName = "customer_name"
        case customerEmail = "customer_email"
        case customerPhoneNo = "customer_phone_no"
        case customerPhoneCode = "customer_phone_code"
        case leadType = "lead_type"
        case departmentId = "department_id"
        case comment
    }
    
}
