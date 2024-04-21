//
//  CPData.swift
//  clicks2compare
//
//  Created by Nitin Singh on 02/01/24.
//

import Foundation


class CPData: Codable, Identifiable {
    let name: String
    let flag: String
    let code: String
    let dial_code : String
    
    static let allCountries : [CPData] = Bundle.main.decode("countrydialinfo.json")
    
}


extension Bundle {
    func decode<T : Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else { fatalError("There is error in \(file)")}
        
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("There is error in \(url)")
            
        }
        
        let decoder = JSONDecoder()
        
        guard let countries = try? decoder.decode(T.self, from: data) else {fatalError("There is problem in parsing the data")}
        
        return countries
    }
}
