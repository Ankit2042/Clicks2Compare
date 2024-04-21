//
//  ProfileSettingRequiest.swift
//  clicks2compare
//
//  Created by user257152 on 2/14/24.
//

import Foundation


struct ProfileSettingRequest: Codable {
    let name: String
    let refralPhone: String
    let occupation: String?
    let companyname: String?
    let paymentMode: String?
    let bankName: String?
    let bankAccountNumber: String?
    let iban: String?
    let designation: String?
    let email: String?
    let recommendedBy: String
    
    
    enum CodingKeys: String, CodingKey{
        case name , occupation, companyname, paymentMode, iban
        case refralPhone = "refral_phone"
        case bankName = "bank_name"
        case bankAccountNumber = "bank_account_number"
        case designation
        case email
        case recommendedBy = "recommended_By"
    }
}
