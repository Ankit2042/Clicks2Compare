//
//  SingUpResponse.swift
//  clicks2compare
//
//  Created by Nitin Singh on 09/12/23.
//

import Foundation





struct SingUpResponse: Codable {
    let code: Int
    let status: String
    let message: Message
   
}

struct Message: Codable {
    let error: [String]?
    let success: [String]?
        
}


