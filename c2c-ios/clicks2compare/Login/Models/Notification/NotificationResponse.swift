//
//  NotificationResponse.swift
//  clicks2compare
//
//  Created by user257152 on 2/6/24.
//

import Foundation



struct NotificationResponse: Decodable {
    let code: Int
    let status: String
    let message: NotificationMessage
    let data: [NotificationData]?
}

struct NotificationMessage: Decodable {
    let success: [String]?
    let error : [String]?
}

struct NotificationData: Hashable,  Decodable {
    let message: String
    let date: String
}
