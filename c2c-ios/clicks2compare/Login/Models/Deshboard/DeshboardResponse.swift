//
//  DeshboardResponse.swift
//  clicks2compare
//
//  Created by Nitin Singh on 22/12/23.
//

import Foundation






struct DeshboardResponse:  Codable {
    let id: Int

    let name: String

    let recommendedBy: String
    let email: String

    let referralPhone: String

    let paymentMode: String?
    let bankName: String?
    let bankAccountNumber: String?
    let iban: String?
    let occupation: String?

    let designation: String?

    
    enum CodingKeys : String, CodingKey {
        case id
        case name, email
        case recommendedBy = "recommended_by"
        case referralPhone = "refral_phone"
        case bankName = "bank_name"
        case bankAccountNumber = "bank_account_number"
        case designation , paymentMode, occupation
        case iban
    }
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let  components = formatter.personNameComponents(from: name) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
            return ""
    }
}


struct ErrorResponse: Decodable {
    let code: Int
    let status: String
    let message: ErrorMessage
}

struct ErrorMessage: Decodable {
    let error: [String]
}
