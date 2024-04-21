//
//  LeadDetailRequest.swift
//  clicks2compare
//
//  Created by Nitin Singh on 11/01/24.
//

import Foundation


struct LeadDetailRequest : Codable {
    let leadId: Int
    
    enum CodingKeys : String , CodingKey {
        case leadId = "lead_id"
    }
}
