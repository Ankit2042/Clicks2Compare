//
//  SingUpRequest.swift
//  clicks2compare
//
//  Created by Nitin Singh on 09/12/23.
//

import Foundation


struct SingUpRequest: Encodable {
    let name : String
    let email: String
    let refralphone: String
    let password: String
    let recommendedby: String
    let agree: Bool
    
    
    enum CodingKeys: String, CodingKey{
        case name,email
        case refralphone = "refral_phone"
        case recommendedby = "recommended_by"
        case password
        case agree
    }
}



