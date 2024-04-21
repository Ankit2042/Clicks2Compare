//
//  LoginResponse.swift
//  clicks2compare
//
//  Created by Nitin Singh on 29/11/23.
//


import Foundation


struct LoginResponse: Codable {
    let code: Int
    let status: String
    let message: String
    let data: DataResponse?
    let accessToken, tokenType: String?
}

struct DataResponse: Codable {
    let id: Int?
    let name, recommendedBy, email, refralPhone: String?
    let companyname, paymentMode, bankName, bankAccountNumber: String?
    let iban, occupation: String?
}


