//
//  ProfileSettingResponse.swift
//  clicks2compare
//
//  Created by user257152 on 2/14/24.
//

import Foundation




struct ProfileSettingResponse: Codable {
    let code: Int
    let status: String
    let message: ProfileSettingMessage
}

struct ProfileSettingMessage: Codable {
    let success: [[String]]?
    let error: [String]?
}
