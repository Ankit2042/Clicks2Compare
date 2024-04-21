//
//  VarifyRequest.swift
//  clicks2compare
//
//  Created by Nitin Singh on 12/12/23.
//

import Foundation


struct VerifyRequest: Encodable {
    let email: String?
    let code: String?


    enum CodingKeys: String, CodingKey{
        case email
        case code
    }
}
